## Generate csr for namecheap

official link : https://www.namecheap.com/support/knowledgebase/article.aspx/9446/2290/generating-csr-on-apache-opensslmodsslnginx-heroku/

```shell
openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain_tld.key -out yourdomain_tld.csr
```

