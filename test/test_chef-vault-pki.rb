require 'test/unit'
require 'chef-vault-pki'

class ChefVaultPKITest < Test::Unit::TestCase

  def test_ca_default_subject
    ca = ChefVaultPKI::CA.new
    ca.generate!
    assert_equal "/CN=chef_vault_pki_ca", ca.cert.subject.to_s
  end

  def test_client_default_subject
    ca = ChefVaultPKI::CA.new
    ca.generate!

    client = ChefVaultPKI::Client.new
    client.generate! ca
    assert_equal "/CN=chef_vault_pki_client", client.cert.subject.to_s
  end

end

