# DDos

install ab(apache benchmark) to make dDos
```shell
ab -n 1000 -c 100 http://yourdomain.com/
```
* n ==> number of request
* c ==> concurrent request

OR install siege to make dDos attack
```shell
siege -v -c 1 -r 100 https://www.domain.gov.bd/
```

* Get most requested ip address in last 30 minutes `grep "$(date --date='10 minutes ago' +\\[%d/%b/%Y:%H:%M)" /var/log/nginx/access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head`
* Get most requested ips analyzing in last 2000 line `sudo tail -n 2000 /var/log/nginx/access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head`
* Find ip in subdirectory `find /var/log/nginx/ -type f -name "*.log" -exec grep "$(date --date='10 minutes ago' +\\[%d/%b/%Y:%H:%M)" {} \; | awk '{print $1}' | sort | uniq -c | sort -nr | head` 
* Get blocked ip addresses `iptables -L INPUT -v -n | grep -E 'DROP|REJECT'`
* Block an ip address `iptables -I INPUT 1 -s 72.14.201.130 -j DROP`
* Monitor using script in `nginx/monitoring-script`

