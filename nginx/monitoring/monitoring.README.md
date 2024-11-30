# Monitoring nginx load balancer server

* load balancer will use 2 connection for each client, 1 for nginx and 1 for upstream
* Each connection will use 10-12kb memory
* Watch live statistics for nginx server `watch -n1 "netstat -ant | awk '{print \$6}' | sort | uniq -c | sort -n"`
* Watch live established connection `watch -n1 "netstat -ant | grep ESTABLISHED | wc -l"`


## Run Monitoring time script

```shell
# Show last 10 minutes of activity
./nginx_attack_time_monitoring.sh --time 10

# Show last 20 minutes of activity
./nginx_attack_time_monitoring.sh -t 20

# Real-time monitoring
./nginx_attack_time_monitoring.sh --realtime

# One-time full report
./nginx_attack_time_monitoring.sh --once
```