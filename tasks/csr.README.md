## Generate csr for namecheap

official link : https://www.namecheap.com/support/knowledgebase/article.aspx/9446/2290/generating-csr-on-apache-opensslmodsslnginx-heroku/

## Generate

```shell
openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain_tld.key -out yourdomain_tld.csr
```

## Verify Certificate csr and private key

**First check both csr and private key generate same hash**

For the certificate:
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

