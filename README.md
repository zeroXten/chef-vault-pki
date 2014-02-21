# chef-vault-pki

A simple script to generate a CA for use with the [chef\_vault\_pki](https://github.com/zeroXten/chef_vault_pki) Chef cookbook.

# Installations

Gem is available here:

    $ gem install chef-vault-pki

# Usage

    $ chef-vault-pki --help
    Usage chef-vault-pki [options]
        -n, --name NAME                  NAME for SSL certificate. Defaults to chef_vault_pki_ca
        -e, --expires DAYS               Certificate expires in DAYS days. Defaults to 3655
        -o, --output FORMAT              Output format (json,text). Defaults to json
        -h, --help                       Show this message
        -v, --version                    Show version

## Using it with chef-vault

    $ chef-vault-pki | knife vault create chef_vault_pki chef_vault_pki_ca -J /dev/stdin --search 'role:base' --admins admin-user

## Example output

    $ chef-vault-pki -o text
    -----BEGIN CERTIFICATE-----
    MIICsTCCAZmgAwIBAwIBADANBgkqhkiG9w0BAQUFADAcMRowGAYDVQQDDBFjaGVm
    X3ZhdWx0X3BraV9jYTAeFw0xNDAyMjExNjQyMDRaFw0yNDAyMjQxNjQyMDRaMBwx
    GjAYBgNVBAMMEWNoZWZfdmF1bHRfcGtpX2NhMIIBIjANBgkqhkiG9w0BAQEFAAOC
    AQ8AMIIBCgKCAQEAqDElR5JYXcKrxFVflepfjdGIZEX0A2IrVRxVZRociKnXW6+G
    MgmxLKJre172z3r9kO73zNzRMvsDE4xxYXyYUX9C0G1njkDyn6TBgtx/YETkWjtr
    HCU5yxoZ0P6ZIMYiinj9Xzm3VjeVa5U8eShj5k2FEFGWVgKkbnrrk/o9uHamLIIN
    oyW9b7QOl6RfkEc47Hypan3kUXcGjg99osl0fnUKuUnG3j+d/x/bFepPDG9gwSSV
    gy2ZHUlKEd2MazvTVTcv4wpPVmXNY+fWxrzbNgrc8+SkI9Jhuk3GAOps/YQq4AIi
    1jbrdoOr+/mTb40OjBdujTtVV6kmQkZ8cYCouwIDAQABMA0GCSqGSIb3DQEBBQUA
    A4IBAQBshJWdMktF6JUReDEkE/HXVjVXQQLawkNGhea5VI7Fzu+GOA+QwiKOEwIN
    WqZu14Cn0z0gJ4Ip1aK/4u0rkx4ki1moZ8bWd0cZXJN90eesjILkKqYQu2I8j34/
    XNhUO44q4EULZ4KZvuOu7D5LT7BFbWUmSvtFnHVvt1gPUBjsPIJJlsVgsoL+SxMA
    DrWEBdj7wa8+idFQVKK+3GKZ66YrDUhSipHhHrkdA3Jnls3MMwTFExt6QowB7rOt
    3bsu/k8ZhRP1vQW/drisOpmnOgIQWTdQ3eG9bEKykqYH5wjIvhRCsMG96Ij1zTiv
    1iLE6x1HKNHnk+0X3zaB1+Znfsql
    -----END CERTIFICATE-----
    -----BEGIN RSA PRIVATE KEY-----
    MIIEowIBAAKCAQEAqDElR5JYXcKrxFVflepfjdGIZEX0A2IrVRxVZRociKnXW6+G
    MgmxLKJre172z3r9kO73zNzRMvsDE4xxYXyYUX9C0G1njkDyn6TBgtx/YETkWjtr
    HCU5yxoZ0P6ZIMYiinj9Xzm3VjeVa5U8eShj5k2FEFGWVgKkbnrrk/o9uHamLIIN
    oyW9b7QOl6RfkEc47Hypan3kUXcGjg99osl0fnUKuUnG3j+d/x/bFepPDG9gwSSV
    gy2ZHUlKEd2MazvTVTcv4wpPVmXNY+fWxrzbNgrc8+SkI9Jhuk3GAOps/YQq4AIi
    1jbrdoOr+/mTb40OjBdujTtVV6kmQkZ8cYCouwIDAQABAoIBAH/KJ2sD1EQY3u0j
    eKatFsDoDNszEz1m30mhZ3iTqE5lzQ0KhcmK96TUGxn3g0sNRY9TIc/zjrdPZHz7
    3kGVqx1wtdEq7t10l2OYiLbm1ZjNfzrXnoAaAJlCUY8rgikWobPYTZqGfbfyL4M4
    NmRPveeDyrAlbTYYd9rBZjBel3qI4FOPScN9awaUNqJvjTlANrQerV5Wd0emDoz2
    tQCO3t34FrbWxmxdyVDDWssjDasMkh+9icDlq0NT/x86NHaJNHjqrudXMIucg3Sg
    nTIqUoNs/HqsItHGYECh+/B8PD0/9w2MGTfhoIPEiIbiygw/sVM4gmF2R6dEiu3i
    KbeXvmECgYEAz9KdjanJsoHlbeqU2mpZnWACeJSx8DFvTEy3Wc31dvER6RwMAKiE
    2J5qW+0JbgCraDCFQutdxlXnQiFGYJ06XGry/mk83IDHr7ABZvVoqGgcqbONzrnr
    yh2lRobCXb6REITSHfos0LpPrOMc9ocsdXJmVBZGPXeLClhVfZsq4VkCgYEAzy6d
    uDbvPgrmXQZnMxc80BmlpYuHLUYelZACGOpPAFWhn75Ctq16FhdsUcVTTA3SHQuP
    XfPp9dYpmV4E1YgoyhQHA53HsOerA9Dv6wRXmTKOZmCCcZptZ3b43KnwDt47j6uR
    tTEfJoBVdCow6cibLcn2lVbNEY3bkiNkxEKHZDMCgYEAohvG/Ebx50V94pR2Uj1c
    8+59XvOWLSdSivDYoLuQepwm/W/8SNMq9RH1IwmuLlllWxtmB8Iy3tAJWUM9c4WR
    jZ97Nkp+x/3IRdoD7f0GCz9TBGjj99p8+6bOUkox+Q/6dik1AV8xcAu0tMZfxEnC
    u0ZmXbcWSUIjeglXfmf4NdkCgYAorsmvs7HU6AUGPUykfqqlXnPlhvl7TWqSCd4v
    kEsFEMuU96JYBsaTcfQGNo49v/UDWRLE6zGE4ZH3mLuwRnVkAPzDnAbrWQJ+1FdY
    OdkNrxzBQ7A5qI5VI8qIYiJOeRsPAiyxfLzWLZsaHXLPZWH7Ys410v6ftNBp6ONP
    mpTFewKBgBkv/iItfLv47GNMmNbETKbhd93ZfQG4M+XC1CbyPli5z6Qxya5ovNup
    7TGPvGQLTJCpjQv/HKk8waoQCXIBjEqNWlULcUZposuF7Vcu+our1xAu4btL1PNH
    +4ib0f0YzwOoxnp4w/+NQ6Ht/jZJSam2wPp5KOHAs/gA0/e4qjar
    -----END RSA PRIVATE KEY-----
