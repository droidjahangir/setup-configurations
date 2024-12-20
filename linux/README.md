# Linux

### Basic info command

* Hostname `hostname`
* kernel and OS info `uname -a`
* OS release info `cat /etc/os-release`
* CPU info `lscpu`
* get number or worker_process `nproc`
* Memory info `free -h`
* Disk info `df -h`
* Disk partition `lsblk`
* Network info `ip a` routing table `ip route` or `ifconfig` it needs to install net-tools
* Hardware info `lshw -short`
* Virtualization `systemd-detect-virt` and details info `sudo dmidecode -t system`

### Few common command

* `df -h` ---> disk space usages
* `lsblk` ---> all available block devices
* `du -sh` --> total size of current directory

**Search file content in a directory**
```shell
grep -ri "search-term" /path/to/directory
```

**Search a file**
```shell
find . -name "myfile.txt"
```

### Networking

Install this package for ipaddress
```shell
sudo apt install net-tools
```
see ip address `ifconfig`  and `ip address show`

`ifconfig -a` it show all of enable and disabled addresses

we can also use `if a`

ipv4 ---> `ip -4 address` ipv6 ---> `ip -6 address`

`ifconfig enp0s3` to see specific interface configuration

* Test a port is reachable to a specific id `telnet 192.168.44.113 22` or `nmap -p 22 192.168.44.113 -Pn`
* We can also check it using netcat `nc -zv 192.333.143.55 4567`

Allowed and Rejected port to see `sudo iptables -vnL` Good to use `ufw`

* `netstat -tupan` ---> see ip and port to open
* `ss -tupan` --------> see ip and port to open
* `lsof -u user_name` -> see which files are opened by this user
* `sudo lsof -c nginx` -------> see all files which are opened by nginx
* `lsof -iTCP -sTCP:LISTEN` --> show which process are used to open for listening
* `telnet  192.168.0.22 22` -> check this port are opened by this ip
* `df -TH` Displays disk space usage in a human-readable format
* `lscpu` Provides detailed information about the CPU architecture
* `free -m` Shows memory usage (RAM and swap) in megabytes



**nmap** this is a port scanner tool
* `sudo nmap 192.168.1.1` ---> this show which ports are open for this ip address

**router**

* see routing table `route -n` 
* Flag (G) means routing gateway
* Current dns server can see from this command `resolvectl status`
* Down or Up an interface `ifconfig enp0s3 downn` or `ifconfig enp0s3 up` 
* delete gateway or ip `route del default gw 192.168.0.1` or `route add default gw 192.168.0.1`
* set macAddress `ip link set dev enp0s3 address 08:00:27:51:05:01`
* check network manager status `sudo systemctl status NetworkManager`

**Testing and troubleshooting**

* send 4 packet `ping -c 4 ubuntu.com`
* send packet with 0.4 millisecond interval, default interval is 1 second `ping -i 0.4 -c 5 ubuntu.com`
* check any internet connectivity issue in public DNS server in cloudflare `ping 1.1.1.1`

**Openssh**

* install openssh `sudo apt update && sudo apt install openssh-server openssh-client`

### Domain

* `dig -t ns cisco.com` --->> it send me ip address for this domain

### Find public ip address
```shell
curl ifconfig.io
```


### Zip or compress a directory
```shell
zip -r archive_name.zip folder1
```

Make higher compress level to make it's size lower. (compress level from 1-10)
```shell
zip -r -9 myfolders.zip folder1
```

## Date time

update server date time
```shell
timedatectl set-timezone Asia/Dhaka
```

### Check which process are used this port 
```shell
sudo lsof -i :6443
```

curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | sudo bash -s -- --mariadb-server-version="mariadb-10.6"


# symlink/mount/bind

```shell
# Mount NFS share locally for Nginx
mount --bind /mnt/nfs_share /var/www/html

# Or create a symlink
ln -s /mnt/nfs_share /var/www/html
```




