require 'openssl'

module ChefVaultPKI

  class CA
    attr_accessor :key, :cert

    def initialize(args = {})
      @config = {
        :key_size => 2048,
        :expires => 10,
        :expires_factor => 60 * 60 * 24,
        :name => 'chef_vault_pki_ca'
      }
      @config.keys.each do |key|
        if args.has_key? key
          @config[key] = args[key]
        end
      end
      self
    end

    def generate!
      name = OpenSSL::X509::Name.parse "CN=#{@config[:name]}"
      not_before = Time.now
      not_after = not_before + (@config[:expires] * @config[:expires_factor])

      @key = OpenSSL::PKey::RSA.new @config[:key_size]

      @cert = OpenSSL::X509::Certificate.new
      @cert.version = 3
      @cert.serial = Time.now.to_i
      @cert.not_before = not_before
      @cert.not_after = not_after
      @cert.public_key = key.public_key
      @cert.subject = name
      @cert.issuer = name
      #cert.sign key, OpenSSL::Digest::SHA1.new
      extension_factory = OpenSSL::X509::ExtensionFactory.new
      extension_factory.subject_certificate = @cert
      extension_factory.issuer_certificate = @cert
      extension_factory.create_extension 'subjectKeyIdentifier', 'hash'
      extension_factory.create_extension 'basicConstraints', 'CA:TRUE', true
      extension_factory.create_extension 'keyUsage', 'cRLSign,keyCertSign', true
      @cert.sign @key, OpenSSL::Digest::SHA1.new
    end

    def load!(hash)
      @key = OpenSSL::PKey::RSA.new hash['key']
      @cert = OpenSSL::X509::Certificate.new hash['cert']
    end

  end

  class Client
    attr_accessor :key, :csr, :cert

    def initialize(args = {})
      @config = {
        :key_size => 2048,
        :expires => 10,
        :expires_factor => 60 * 60 * 24,
        :name => 'chef_vault_pki_client'
      }
      @config.keys.each do |key|
        if args.has_key? key
          @config[key] = args[key]
        end
      end
    end

    def generate!(ca)
      name = OpenSSL::X509::Name.parse "CN=#{@config[:name]}"
      not_before = Time.now
      not_after = not_before + (@config[:expires] * @config[:expires_factor])

      @key = OpenSSL::PKey::RSA.new @config[:key_size]

      @csr = OpenSSL::X509::Request.new
      @csr.version = 0
      @csr.subject = name
      @csr.public_key = @key.public_key
      @csr.sign @key, OpenSSL::Digest::SHA1.new

      @cert = OpenSSL::X509::Certificate.new
      @cert.serial = 0
      @cert.version = 2
      @cert.not_before = not_before
      @cert.not_after = not_after

      @cert.subject = @csr.subject
      @cert.public_key = @csr.public_key
      @cert.issuer = ca.cert.subject

      extension_factory = OpenSSL::X509::ExtensionFactory.new
      extension_factory.subject_certificate = @cert
      extension_factory.issuer_certificate = ca.cert
      extension_factory.create_extension 'basicConstraints', 'CA:FALSE'
      extension_factory.create_extension 'keyUsage', 'keyEncipherment,dataEncipherment,digitalSignature'
      extension_factory.create_extension 'subjectKeyIdentifier', 'hash'

      @cert.sign ca.key, OpenSSL::Digest::SHA1.new
    end

    def load!(hash)
      @key = OpenSSL::PKey::RSA.new hash['key']
      @cert = OpenSSL::X509::Certificate.new hash['cert']
    end

  end

end
