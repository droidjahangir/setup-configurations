# DDos

install siege to make dDos attack
```shell
siege -v -c 1 -r 100 https://www.domain.gov.bd/
```

* Get most requested ip address in last 30 minutes `grep "$(date --date='10 minutes ago' +\\[%d/%b/%Y:%H:%M)" /var/log/nginx/access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head`
* Get blocked ip addresses `iptables -L INPUT -v -n | grep -E 'DROP|REJECT'`
* Block an ip address `iptables -I INPUT 1 -s 72.14.201.130 -j DROP`
* 

