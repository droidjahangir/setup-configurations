# Percona cluster

**Step-1**
Install relevant packages, Official documentation : https://docs.percona.com/percona-xtradb-cluster/8.0/apt.html


### Master node configuration
configure haproxy in percona cluster `/etc/haproxy/haproxy.cfg`
```shell
global
#log 127.0.0.1 local0
#log 127.0.0.1 local1 notice
log /dev/log    local0
log /dev/log    local1 notice
stats socket /var/run/haproxy/admin.sock mode 660 level admin
stats timeout 30s

maxconn 4096
#chroot /usr/share/haproxy
chroot /var/lib/haproxy
user haproxy
group haproxy
daemon

defaults
log global
mode http
option tcplog
option dontlognull
retries 3
option redispatch
maxconn 2000
#contimeout 5000
#clitimeout 50000
#srvtimeout 50000
timeout connect 5000
timeout client  50000
timeout server  50000

#frontend pxc-front
#bind *:3307
#mode tcp
#default_backend pxc-back

frontend stats-front
bind *:8080
mode http
default_backend stats-back

frontend pxc-onenode-front
bind *:3306
mode tcp
default_backend pxc-back

backend pxc-back
mode tcp
balance leastconn
option httpchk
server DB1 10.0.0.451:3306 check port 9200 inter 12000 rise 3 fall 3
server DB2 10.0.0.452:3306 check port 9200 inter 12000 rise 3 fall 3
server DB3 10.0.0.453:3306 check port 9200 inter 12000 rise 3 fall 3
server DB4 10.0.0.454:3306 check port 9200 inter 12000 rise 3 fall 3
server DB5 10.0.0.455:3306 check port 9200 inter 12000 rise 3 fall 3

backend stats-back
mode http
balance roundrobin
stats uri /haproxy/stats
stats auth pxcstats:secret


backend pxc-onenode-back
mode tcp
balance leastconn
option httpchk
server DB1 10.0.0.249:3306 check port 9200 inter 12000 rise 3 fall 3
server DB2 10.0.0.259:3306 check port 9200 inter 12000 rise 3 fall 3
server DB3 10.0.0.349:3306 check port 9200 inter 12000 rise 3 fall 3
server DB4 10.0.0.244:3306 check port 9200 inter 12000 rise 3 fall 3
server DB5 10.0.0.279:3306 check port 9200 inter 12000 rise 3 fall 3
```


### Worker node Configuration
configure mysql percona cluster in `/etc/mysql/percona-xtradb-cluster.conf.d/wsrep.cnf`

```shell
[mysqld]
# Haproxy config
server_id=1
log_bin=mysql-bin
datadir=/var/lib/mysql
log_slave_updates
innodb_autoinc_lock_mode=2
#innodb_buffer_pool_size=16G
#max_allowed_packet=1G
# Path to Galera library
innodb_buffer_pool_size=12G
max_allowed_packet=256M
innodb_log_file_size=2G
wsrep_provider=/usr/lib/galera3/libgalera_smm.so

# Cluster connection URL contains IPs of nodes
#If no IP is found, this implies that a new cluster needs to be created,
#in order to do that you need to bootstrap this node
wsrep_cluster_address=gcomm://10.0.0.567,10.0.0.457,10.0.0.458,10.0.0.459,10.0.0.460

# In order for Galera to work correctly binlog format should be ROW
binlog_format=ROW

# MyISAM storage engine has only experimental support
default_storage_engine=InnoDB

# Slave thread to use
wsrep_slave_threads= 8

wsrep_log_conflicts

# This changes how InnoDB autoincrement locks are managed and is a requirement for Galera
innodb_autoinc_lock_mode=2

# Node IP address
wsrep_node_address=10.0.0.239
# Cluster name
wsrep_cluster_name=directorate-cluster

#If wsrep_node_name is not specified,  then system hostname will be used
wsrep_node_name=db5

#pxc_strict_mode allowed values: DISABLED,PERMISSIVE,ENFORCING,MASTER
pxc_strict_mode=DISABLED

# SST method
wsrep_sst_method=xtrabackup-v2

#Authentication for SST method
wsrep_sst_auth="sstuser:pAssW0rd!"
```



