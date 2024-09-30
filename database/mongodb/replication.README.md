## Replication

**step-1**
<br>run Vagrantfile to provision 3 machine

**step-2**
<br>install mongodb to each node
Official documentation : https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

```shell
sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl daemon-reload
sudo systemctl restart mongod   
```

**step-3**
<br> To allow 27017 port to communicate with each other node, We need to configure `/etc/mongod.conf` file
```shell
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# Where and how to store data.
storage:
  dbPath: /var/lib/mongodb
#  engine:
#  wiredTiger:

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0


# how the process runs
processManagement:
  timeZoneInfo: /usr/share/zoneinfo

#security:

#operationProfiling:

replication:
  replSetName: "mongo-replica"

#sharding:
```

**step-4**
<br> Activate ufw(firewall) and allow 27017 port. Firewall docs : https://ubuntu.com/server/docs/firewalls

```shell
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 27017
```

check firewall status : `sudo ufw status`

**step-5**
<br> Test connection from different machine `mongosh --host 192.168.56.101 --port 27017`


**step-6**
<br> Go to first node and enter the mongosh console. then create replication using this command
```shell
rs.initiate(
  {
    _id: "mongo-replica",
    members: [
      { _id: 0, host: "192.168.56.101:27017" },  // Primary node
      { _id: 1, host: "192.168.56.102:27017" },  // Secondary node 1
      { _id: 2, host: "192.168.56.103:27017" }   // Secondary node 2
    ]
  }
)
```
Check status `> rs.status()`

Insert 100 document and check it from different nodes 
```shell
use test;

for (let i = 1; i <= 100; i++) {
    db.testCollection.insert({ name: "Document " + i });
}
```

get all documents `> db.testCollection.find().pretty();`
