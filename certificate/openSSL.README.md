## Openssl

verify certificate
```shell
openssl x509 -in lmap_minland_gov_bd.crt -noout -text
```

## Generate certificate signing request (CSR)

```shell
openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain_tld.key -out yourdomain_tld.csr
```

## Verify Certificate csr and private key
```shell
openssl rsa -in lmap.minland.gov.bd.key -noout -modulus | openssl md5
openssl x509 -in lmap_minland_gov_bd.crt -noout -modulus | openssl md5
```

**First check both csr and private key generate same hash**

For the csr/certificate_signing_request:
```shell
openssl x509 -noout -modulus -in /cert/example.crt | openssl md5
```

For private key
```shell
openssl rsa -noout -modulus -in /cert/example.key | openssl md5
```

Get private key info
```shell
openssl rsa -check -in /cert/example.key
```

View certificate information
```shell
openssl x509 -in /cert/example.crt -text -noout
```

Check apache configuration
```shell
apache2ctl -S
```
