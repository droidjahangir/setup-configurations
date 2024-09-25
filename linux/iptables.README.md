## Allow or Block ip addresses


* `iptables -I INPUT 1 -p tcp --dport 9000 -j ACCEPT` --> Allow a port
* `sudo iptables -I INPUT 1 -s 192.168.1.104 -j DROP` --> Block traffic from this ip address.


