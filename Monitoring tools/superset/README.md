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

user : superset
pass: superset1234