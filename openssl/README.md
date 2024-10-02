## generate ssl key

```shell
openssl genrsa -aes256 -out private_key.pem 2048
```

#### generate new certificate signing request (CSR)

```shell
openssl req -new -sha256 -key private_key.pem -out signing_request_csr.pem
```



