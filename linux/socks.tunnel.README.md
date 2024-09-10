# Socks tunnel to create a secure tunnel to transfer data between 2 server

N:B: get details from this digital ocean article `https://www.digitalocean.com/community/tutorials/how-to-route-web-traffic-securely-without-a-vpn-using-a-socks-tunnel`

Create a tunnel
```shell
ssh -i ~/.ssh/id_rsa -D 1337 -f -C -q -N sammy@your_domain
```

* -D: Tells SSH that we want a SOCKS tunnel on the specified port number (you can choose a number between 1025 and 65536)
* -f: Forks the process to the background 
* -C: Compresses the data before sending it 
* -q: Uses quiet mode 
* -N: Tells SSH that no command will be sent once the tunnel is up

#### verify this tunnel
This will back you a process id, which later we can kill to stop this tunnel.
```shell
ps aux | grep ssh
```

Kill this tunnel `kill <process_id>`