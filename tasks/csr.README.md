## Generate csr for namecheap

official link : https://www.namecheap.com/support/knowledgebase/article.aspx/9446/2290/generating-csr-on-apache-opensslmodsslnginx-heroku/

## Generate

```shell
openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain_tld.key -out yourdomain_tld.csr
```

## Verify
Verify csr
```shell
openssl req -text -noout -verify -in my-csr.csr
OR
openssl req -in mycsr.csr -noout -text
```

Verify crt file
```shell
openssl x509 -in server.crt -text -noout
```
