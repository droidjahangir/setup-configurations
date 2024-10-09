# Redis

Install redis from official documentation instruction

https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/install-redis-on-linux/

Installation script
```shell
sudo apt-get install lsb-release curl gpg
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
sudo chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
sudo apt-get install redis -y
```

### Check status

```shell
# check version
redis-server --version

# check status
systemctl status redis-server.service

# start redis server
systemctl start redis-server.service

# restart redis service
systemctl restart redis-server.service
```