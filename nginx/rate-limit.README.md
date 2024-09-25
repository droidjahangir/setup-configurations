## configure nginx for rate limit

```shell
user www-data;
worker_processes auto;

events {
  worker_connections 1024;
}

http {
  limit_req_zone $request_uri zone=test_zone:10m rate=1r/s;
  
  server {
    listen 443 ssl http2;
    server_name domain.gov.bd/ip;
    
    root /rootDirectoryLocation/
    
    location / {
      limit_req zone=test_zone burst=5 nodelay;
      try_files $uri $uri/ =404;
    }
  }
}
```


siege -v -c 1 -r 100 https://www.bcc.gov.bd/

