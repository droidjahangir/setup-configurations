# NFS

#### following step in NFS server
1. Install nfs server package `sudo apt install nfs-kernel-server`
2. Restart this service `sudo systemctl start nfs-kernel-server.service`
3. In `/etc/exports` file we should declare those directory which we want to share
```shell
/mnt/ministry/ministrycluster *(rw,async,no_subtree_check,no_root_squash)
/mnt/ministry/php *(rw,async,no_subtree_check,no_root_squash)
```
4. open ports which will used for NFS server. It will declare in IPtables
```shell
# Allow NFS (TCP/UDP port 2049)
sudo iptables -A INPUT -p tcp --dport 2049 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 2049 -j ACCEPT

# Allow rpcbind (TCP/UDP port 111)
sudo iptables -A INPUT -p tcp --dport 111 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 111 -j ACCEPT

# Allow mountd (configured to use port 4002)
sudo iptables -A INPUT -p tcp --dport 4002 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 4002 -j ACCEPT

# Allow statd (configured to use ports 4000 and 4001)
sudo iptables -A INPUT -p tcp --dport 4000 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 4000 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 4001 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 4001 -j ACCEPT
```
5. then run this command to expose those port permanently `sudo iptables-save > /etc/iptables/rules.v4`
6. Apply NFS configuration `sudo exportfs -a`
7. Restart this service `systemctl status nfs-server.service`

#### following steps in NFS client server
1. Install this package `sudo apt install nfs-common`
2. declare which files in `/etc/fstab` which we want to mount from NFS server
```shell
10.12.3.75:/mnt/ministry/ministrycluster /var/www/ministrycluster nfs4 auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
10.12.3.75:/mnt/ministry/php /var/lib/php/sessions nfs4 auto,nofail,noatime,intr,tcp,actimeo=1800 0 0
```
4. Mount those files `mount -a`



