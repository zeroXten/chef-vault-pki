# chef-vault-pki

A simple tool to manage CA and client certs for use with the [chef\_vault\_pki](http://community.opscode.com/cookbooks/chef_vault_pki) Chef cookbook.

# Installation

Gem is available here:

    $ gem install chef-vault-pki

# Usage

    Usage chef-vault-pki [command] [options]

    Commands:
        ca - Creates a CA (default)
        client - Creates a client (CA must be provided on STDIN as JSON)

    Common options:
        -n, --name NAME                  NAME for SSL certificate. Defaults to chef_vault_pki_ca
        -k, --key_size KEY_SIZE          Use KEY_SIZE bits for the key. Defaults to 2048
        -e, --expires DAYS               Certificate expires in DAYS days. Defaults to
        -o, --output FORMAT              Output format (json,text). Defaults to json
        -h, --help                       Show this message
        -v, --version                    Show version

## Creating a CA

    $ chef-vault-pki

## Generating a CA and passing that to a new client (not very useful)

    $ chef-vault-pki ca | chef-vault-pki client

## Creating a CA for chef-vault

    $ chef-vault-pki | knife vault create chef_vault_pki chef_vault_pki_ca -J /dev/stdin --search 'role:base' --admins admin-user

## Creating a client from chef-vault

    $ knife vault show chef_vault_pki chef_vault_pki_ca -F json | chef-vault-pki client -o text

## Example output

    $ chef-vault-pki ca | chef-vault-pki client -o text
    -----BEGIN CERTIFICATE-----
    MIICsTCCAZmgAwIBAgIBADANBgkqhkiG9w0BAQUFADAcMRowGAYDVQQDDBFjaGVm
    X3ZhdWx0X3BraV9jYTAeFw0xNDAzMTQxNjQzMjFaFw0xNTAzMTQxNjQzMjFaMBwx
    GjAYBgNVBAMMEWNoZWZfdmF1bHRfcGtpX2NhMIIBIjANBgkqhkiG9w0BAQEFAAOC
    AQ8AMIIBCgKCAQEAny4WkexHxQVCXtbJripOloRuLELcDHbDgQP2x8qPbyeJuuuB
    wduheBKgHrvN5Eq3GaUUz+c0A8/lXVInk5HYgFF7bU2ofLlUMlUWUJhbEdhTEJX0
    gkHklYhoLQE5tZkFFqWsffo7VRHrogKlxw8mlsxpDeG2S1LAnnK6cSYf5uy1jaXi
    KEU9kQnPQBUKnj4dIpg2RsGVW3j6kKAMWC+m+21WWHHWtjyrxUVUs417kjac1uuY
    9M2wwg7YjAZ3UUJaRdmokns/wdBzjalaMZvuS2IQRA+3fJOxiJ6uu2PBFxlLh38V
    9fi9Bg1WZ5BF4xKZNM6MRroasmuE+zC7QLRaVwIDAQABMA0GCSqGSIb3DQEBBQUA
    A4IBAQC1xrvRz3l34G8PU8i/VslF4h4PdwTbw7KHOU20fQPVTDGjk8PUo/wwOLi2
    9dPJUhlzyLQXOarulhSRHgcNzU5eQBgZ7UbO4kQImmhzTZOf1rjBP3tUciqsfrqO
    TFcbPMQIKBTPRp73VYJlT/kYLOCl1fl50DPPUbA0MAv9UDKae26ieTzw9qxAKWuC
    GDoMw8L0k1Gtc+eg2DNj0sVhBRAPueU8A2kGlHEvs3j7E44yxiy63gDS2KzLFE8G
    gmHNDnI1PJwQ1F00Qrnhj38DEqBbrFPkDkOq47t9+eJ+QkfsK9VdCAHyJ3krseVI
    A6En7cuTjahFAUbDG+kRabZUubDq
    -----END CERTIFICATE-----
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAny4WkexHxQVCXtbJripOloRuLELcDHbDgQP2x8qPbyeJuuuB
    wduheBKgHrvN5Eq3GaUUz+c0A8/lXVInk5HYgFF7bU2ofLlUMlUWUJhbEdhTEJX0
    gkHklYhoLQE5tZkFFqWsffo7VRHrogKlxw8mlsxpDeG2S1LAnnK6cSYf5uy1jaXi
    KEU9kQnPQBUKnj4dIpg2RsGVW3j6kKAMWC+m+21WWHHWtjyrxUVUs417kjac1uuY
    9M2wwg7YjAZ3UUJaRdmokns/wdBzjalaMZvuS2IQRA+3fJOxiJ6uu2PBFxlLh38V
    9fi9Bg1WZ5BF4xKZNM6MRroasmuE+zC7QLRaVwIDAQABAoIBAQCIIzCmaIARHqhe
    2C/wxrojvOtE64GrHz+hbbR3tuPpWtVOifCVzbNRMAzFfDVg1A243xjnnoM752fw
    4jx61zdkt0tqdgptcUtzKJZHI6ZvoqWX/8f4R0aqJNmD9BJZH5/ceKEHtSVdYlA2
    ZTFHB8wnGHeYqbvwu7uFR/Xwo3yRT/OtaCSInBLny1cRoQwwONbLJkDLV0PD1Gjq
    BLtIuc3Tgx5mFu9HMuSfkbP1PiquQPTO58bHr4cc2PJaHUIUA4Mvp7wRsgtedTiz
    8lXLOtf6TpVTf4YAKK1QN4gyCr3fQGSTJliM2mZgB8ThnsNY93HEZk9u+Bhz0+jD
    WiCNzm7xAoGBAM5cgLH8hMOpQPqplOF0WxxdZLSi5Nww1CycXbnybagfNZS3yatV
    NdGIfhtrN3zCF8zXVJx/ZPRvYCojJT4MGWossUqW98g5BFbKOPwN3gYHkgKbYtPq
    WCnHJTn9+43XaJ5EY2bw95/twPdIKcAjvAeuI3awRxcNf7KPtw/B4c+DAoGBAMV4
    NszWM94yJiMwBJQIqLy8MImy4R8FyyhgaArPsnR0UL176TrMOxg7hnhTcXILmRpf
    ryYdhdN1n0+tkLyqwgetwb1xVRglw+wf/Ks2CSTxA2IG0E51MwmVS4+3cmnGGybU
    LmbsSmemf2AmBla5JCaT4seERfuYzpHnoUvyXN2dAoGAXk8aJb2Q81ajsqrTtqGV
    jgYEoyUa0KKkJOslTnjDsqTouNmxmdKscOEfOOqsBiEx/VSff5IdEjTgTwGW4J9o
    8gQQ1lTeUqv0FrH+jvrLcBf/m59l8BFWT2mK0tEHKNC8KDB6+S3BDV775EcfhYcP
    RLdJz9FJ+/gYVwOlFtd1mn8CgYBWytijPX68qaQTkTZh7lBj6/8Vdrb10LEThRQV
    tGZGQx19uymuuzc6FmerGVnie3CGpAmyogVBBRDJj4rvMcpoX5mo71gsbeToMsL2
    aaCpSPloq4ABDAgrrR/yAfpavUUP0vC2MiMd3ZNcqjndAjD+d7+UW/H6fJZGkN1X
    KSZiDQKBgQCWmY0H1/c1X2O/QD0//8osYfFUV1Zu5wvTAaI9tX6JCRBrgMbSOloV
    b9pvMAqCdDdZbHPfMmrRHIS92RJy6hPWxc1iC/Y/d7B5e3Xb+GfQmDRIh39t/oYo
    A4Z5M5uMHbihVAz8Duz5cXrzzcOJ7V+KfnzZdkU4i8EHbEgEl84xlg==
    -----END RSA PRIVATE KEY-----

# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Author

zeroXten - fraser.scott@gmail.com
