## Laravel

Digital ocean documentation guideline for setup production ready server for laravel
https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose-on-ubuntu-20-04

Docker configure for different version of php
https://github.com/laradock/php-fpm

1. First create a Dockerfile for direct run laravel project or trough nginx server using `DockerfileForDirectRunLaravel` or `DockerfileRunWithNginx` file
2. update docker-compose file using those file in `docker-compose` directory
3. If you want to configure using nginx then add file `nginx.conf` to root directory under `docker-compose/nginx/` directory, than volume mount to webserver like this `      - ./docker-compose/nginx/:/etc/nginx/conf.d/`
4. then build and up docker compose file `sudo docker compose up --build`
5. After running those, we need to go to app terminal using this command `sudo docker exec -it 218daf7e0647 /bin/bash` and run `php artisan migrate` 
6. 


## Deployment process with apache server

steps:
1. Create Dockerfile from `./docker/DockerfileUsingApache`
2. Create image using this Dockerfile definition ``





