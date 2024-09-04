## SSH

**Allow specific ip/network address to ssh**

```shell
iptables -A INPUT -p tcp --dport 2278 -s 2.2.4.5 -j ACCEPT
```
Drop specific ip address `iptables -A INPUT -p tcp --dport 2278 -j DROP`


