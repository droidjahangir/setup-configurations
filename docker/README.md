## Docker and Docker compose

#### Build and Run docker compose file

`sudo docker compose build && sudo docker compose up` or `sudo docker compose up --build` ---> this will build and run docker compose file

* `sudo docker compose up -d` ----> run docker compose file in background
* `docker logs -f [container_name_or_id]` ----> get container logs
* `docker exec -it [container_name_or_id] [command]` ----> exec to a container and run command. ex: `docker exec -it [container_name_or_id] /bin/sh`
* 

#### Build Docker from image
```shell
sudo docker build -t jahangir/redis-server:latest .
```

