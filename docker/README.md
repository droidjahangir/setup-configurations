## Docker and Docker compose

#### Build and Run docker compose file

`sudo docker compose build && sudo docker compose up` or `sudo docker compose up --build` ---> this will build and run docker compose file

* `sudo docker compose up -d` ----> run docker compose file in background
* `docker logs -f [container_name_or_id]` ----> get container logs
* `docker exec -it [container_name_or_id] [command]` ----> exec to a container and run command. ex: `docker exec -it [container_name_or_id] /bin/sh`
* 

### Build Docker image
```shell
docker build -t jahangir/superset .
```

#### Build Docker from image
```shell
sudo docker build -t jahangir/redis-server:latest .
```

## Run Docker image
```shell
docker run -d --name superset_from_source -p 8088:8088 hsnbd/superset_from_source
```

### Docker root login 
```shell
docker exec -it -u root 7cb8877a7a29 bash
```

### Get logs
```shell
docker logs -f f6d8cd261a7e
```



