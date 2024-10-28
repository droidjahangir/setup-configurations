## Generate certbot certificate

```shell
# for nginx
certbot --nginx -d <domain_name>

# for apache
certbot --apache -d <domain_name>
```

After running this command, It will generate 90 days validated certificate and update nginx configuration automatically 


