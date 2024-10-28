# Superset

Official documentation : https://superset.apache.org/docs/intro

### Step - 01
First we need to clone git-hub repository. 
Then We can use superset using 2 different method
1. Run Dockerfile
2. Run docker-compose.yaml file

### Step - 02
Then we need to configure secret key for reliable communication. \
Enter the docker container
```shell
docker exec -it -u root <container_id_or_name> /bin/bash
```
We need to root login to install editing tools and other packages. \
Install vim then add local customize configuration file `/app/pythonpath/superset_config.py`

Then add this configuration `SECRET_KEY = "E8gFDe2L/lW32oWS1l06p3//Tim1SZ499MeyC4x3CND9T33fGfv4gUHQ"`. This key will generate from this command `openssl rand -base64 42`

### Step - 03
Then run those command to create login user, database initialization and initialize superset
```shell
docker exec -it 7cb8877a7a90 superset fab create-admin
docker exec -it 7cb8877a7a90 superset db upgrade
docker exec -it 7cb8877a7a90 superset load_examples
docker ps
docker exec -it 7cb8877a7a90 superset init
```

### Optional
Install oracle database dependency driver
```shell
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install dependencies
echo "Updating package list and installing dependencies..."
apt-get update
apt-get install -y libaio1 wget unzip

# Download and install Oracle Instant Client
ORACLE_ZIP="instantclient-basic-linux.x64-19.19.0.0.0dbru.el9.zip"
ORACLE_URL="https://download.oracle.com/otn_software/linux/instantclient/1919000/$ORACLE_ZIP"
ORACLE_DIR="/opt/oracle"

echo "Downloading Oracle Instant Client..."
wget $ORACLE_URL -O /tmp/$ORACLE_ZIP

echo "Installing Oracle Instant Client..."
unzip /tmp/$ORACLE_ZIP -d $ORACLE_DIR
rm -f /tmp/$ORACLE_ZIP

# Update shared library configuration
echo "$ORACLE_DIR/instantclient_19_19" > /etc/ld.so.conf.d/oracle-instantclient.conf
ldconfig

# Set environment variables
export ORACLE_HOME="$ORACLE_DIR/instantclient_19_19"
export LD_LIBRARY_PATH="$ORACLE_HOME:${LD_LIBRARY_PATH}"

# Install cx_Oracle Python package
echo "Installing cx_Oracle..."
pip install cx_Oracle

# Make environment variables available to all users (optional)
echo "Setting environment variables in /etc/profile.d/oracle_env.sh..."
echo "export ORACLE_HOME=$ORACLE_HOME" >> /etc/profile.d/oracle_env.sh
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> /etc/profile.d/oracle_env.sh

echo "Oracle Instant Client and cx_Oracle installation completed."
```

user : superset
pass: superset1234


/app/pythonpath/superset_config.py
SECRET_KEY = "E8gFDe2L/lW32oWS1l06p3//Tim1SZ499MeyC4x3CND9T33fGfv4gUHQ"

docker exec -it 7cb8877a7a90 superset fab create-admin
docker exec -it 7cb8877a7a90 superset db upgrade
docker exec -it 7cb8877a7a90 superset init

#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install dependencies
echo "Updating package list and installing dependencies..."
apt-get update
apt-get install -y libaio1 wget unzip

# Download and install Oracle Instant Client
ORACLE_ZIP="instantclient-basic-linux.x64-19.19.0.0.0dbru.el9.zip"
ORACLE_URL="https://download.oracle.com/otn_software/linux/instantclient/1919000/$ORACLE_ZIP"
ORACLE_DIR="/opt/oracle"

echo "Downloading Oracle Instant Client..."
wget $ORACLE_URL -O /tmp/$ORACLE_ZIP

echo "Installing Oracle Instant Client..."
unzip /tmp/$ORACLE_ZIP -d $ORACLE_DIR
rm -f /tmp/$ORACLE_ZIP

# Update shared library configuration
echo "$ORACLE_DIR/instantclient_19_19" > /etc/ld.so.conf.d/oracle-instantclient.conf
ldconfig

# Set environment variables
export ORACLE_HOME="$ORACLE_DIR/instantclient_19_19"
export LD_LIBRARY_PATH="$ORACLE_HOME:${LD_LIBRARY_PATH}"

# Install cx_Oracle Python package
echo "Installing cx_Oracle..."
pip install cx_Oracle

# Make environment variables available to all users (optional)
echo "Setting environment variables in /etc/profile.d/oracle_env.sh..."
echo "export ORACLE_HOME=$ORACLE_HOME" >> /etc/profile.d/oracle_env.sh
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> /etc/profile.d/oracle_env.sh

echo "Oracle Instant Client and cx_Oracle installation completed."