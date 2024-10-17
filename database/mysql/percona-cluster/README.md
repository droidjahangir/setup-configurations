# Percona Replication Cluster

Install relevant packages, Official documentation : https://docs.percona.com/percona-xtradb-cluster/8.0/apt.html


### Master node configuration
configure haproxy in percona cluster `/etc/haproxy/haproxy.cfg`


### Worker node Configuration
* configure mysql percona cluster in `/etc/mysql/percona-xtradb-cluster.conf.d/wsrep.cnf`
* configure mysqlchk file `/etc/xinetd.d/mysqlchk`
* configure clustercheck file `/usr/bin/clustercheck`
* configure services file `/etc/services` (open 9200 port)

