# Percona Replication Cluster

## step - 1

disable and remove apparmor, selinux
```shell
systemctl stop apparmor.service
systemctl disable apparmor.service
apt purge apparmor
```

* check selinux status `sestatus`. To check this we need to install this package `apt install policycoreutils`

Install relevant packages, Official documentation : https://docs.percona.com/percona-xtradb-cluster/8.0/apt.html


### Master node configuration
configure haproxy in percona cluster `/etc/haproxy/haproxy.cfg`


### Worker node Configuration
* configure mysql percona cluster in `/etc/mysql/percona-xtradb-cluster.conf.d/wsrep.cnf`
* configure mysqlchk file `/etc/xinetd.d/mysqlchk`
* configure clustercheck file `/usr/bin/clustercheck`
* configure services file `/etc/services` (open 9200 port)

Getting ssl files `ls -l /var/lib/mysql/*.pem`
ensure same ssl files `scp node1:/path/to/ssl/ca.pem ./node1-ca.pem`