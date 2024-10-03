## SCP

```shell
scp -P 22 file.txt root@192.168.13.100:~
```

here this file.txt file will transfer to this ip address server

Now I want to send it in another name
```shell
scp -P 22 file.txt root@192.168.13.100:~/ip_rename.txt
```

copy a directory
```shell
scp -r -P 22 mydir1/ root@192.168.13.100:~
```

Preserve modification
```shell
scp -rp -P 22 mydir1/ root@192.168.13.100:~
```

### Copy file from remote source to local destination
copy remote desktop password to local pc in Desktop directory
```shell
scp root@192.168.13.100:/etc/passwd /home/student/Desktop
# scp <from> <to>
```


Transfer a directory it needs to use `-r`
```shell
scp -r root@192.168.13.100:~/Desktop /home/student/Desktop
```

### Transfer file between two different server
```shell
scp user1@IP1:/path_to_source_file user2@IP2:/path_to_destination
```


### If we need to transfer between secure connection 



<VirtualHost *:80>

        ServerAdmin webmaster@kgcr.aalo.xyz
        DocumentRoot /var/www/single-code-base/webroot
        ServerName kalukhaligc.edu.bd
        ServerAlias www.kalukhaligc.edu.bd

        <Directory  "/var/www/single-code-base/webroot">
                Options +Indexes +Includes +FollowSymLinks +MultiViews
                AllowOverride All
#               Require all granted
        </Directory>


        ErrorLog ${APACHE_LOG_DIR}/kgcr.aalo.xyz.error.log
        CustomLog ${APACHE_LOG_DIR}/kgcr.aalo.xyz.access.log combined

#RewriteEngine on
#RewriteCond %{SERVER_NAME} =sel.pathshala.xyz [OR]
#RewriteCond %{SERVER_NAME} =www.sel.pathshala.xyz
#RewriteCond %{SERVER_NAME} =saspect.aalo.xyz
RewriteEngine on
RewriteCond %{SERVER_NAME} =www.kalukhaligc.edu.bd [OR]
RewriteCond %{SERVER_NAME} =kalukhaligc.edu.bd
RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>