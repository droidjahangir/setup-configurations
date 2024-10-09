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
