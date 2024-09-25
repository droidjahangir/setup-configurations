# Cake php deployment process


### Create certificate
install packages
```shell
apt-get instal certbot python3-certbot-nginx python3-certbot-apache
```
generate certificate for nginx `certbot --nginx -d domain.name.com` it will automatically update nginx config for certification
generate certificate for apache2 `certbot --apache -d domain_name.com` it need to install `python3-certbot-apache` package



ip ---> 157.245.62.142


        location / {
            # Apply the rate limit to this location
            limit_req zone=one burst=5 nodelay;

            # Pass traffic to the upstream
            proxy_pass http://bcc;
        }