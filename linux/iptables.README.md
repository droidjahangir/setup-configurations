## Allow or Block ip addresses

* `iptables -I INPUT 1 -p tcp --dport 9000 -j ACCEPT` --> Allow a port
* `sudo iptables -I INPUT 1 -s 192.168.1.104 -j DROP` --> Block traffic from this ip address.
* `iptables -A INPUT -p tcp --dport 2049 -j ACCEPT` --> allow port

### Check ip tables rules
```shell
iptables -L -v -n
```
* `v` for verboose
* `n` for numeric output

### Persist Ip table rules
Install this package
```shell
#ubuntu
sudo apt-get install iptables-persistent

#centos/redhat
yum install iptables
```

Save rules

```shell
sudo iptables-save > /etc/iptables/rules.v4
```

iptables -I INPUT 1 -p tcp --dport 3306 -j ACCEPT


