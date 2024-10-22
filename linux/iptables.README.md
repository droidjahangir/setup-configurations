## Allow or Block ip addresses

* `iptables -I INPUT 1 -p tcp --dport 9000 -j ACCEPT` --> Allow a port
* `sudo iptables -I INPUT 1 -s 192.168.1.104 -j DROP` --> Block traffic from this ip address.
* `iptables -A INPUT -p tcp --dport 2049 -j ACCEPT` --> allow port

### Check ip tables rules

```shell
sudo iptables -L -n
```

### Persist Ip table rules
Install this package `sudo apt-get install iptables-persistent`

during save `sudo netfilter-persistent save`

Or

```shell
sudo iptables-save > /etc/iptables/rules.v4
```





