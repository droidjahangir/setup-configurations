# Lua nginx file server


upload file `curl -X POST -F "file=@/root/my_image.jpg" http://<ip_address>:8088/test`

download file `curl -O http://<ip_address>:8088/uploads/image.png`

delete file `curl -X DELETE http://<ip_address>:8088/test/filename.jpg`

