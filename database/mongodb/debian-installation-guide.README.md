## Install mongodb in debian server

Official installation guide : https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-debian/

**Debian version 11**

```shell
sudo apt-get install gnupg curl

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
   
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
```


Install mongosh to test this connection

```shell
wget -qO - https://www.mongodb.org/static/pgp/server-7.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/debian $(lsb_release -cs)/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt update
sudo apt-get install -y mongodb-mongosh
```

Connect to mongod server `mongosh "mongodb://127.0.0.1:27017"`

update mongo configuration to access it from anywhere or a specific IP addresses `cat /etc/mongod.conf`

add this line `bindIp: 0.0.0.0`

Add new user

```shell
> use admin

> db.createUser({
  user: "myUser",
  pwd: "myPassword",
  roles: [
    { role: "readWrite", db: "myDatabase" }
  ]
})
```

get list of users `db.getUsers()`