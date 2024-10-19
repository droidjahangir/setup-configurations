## rsync

* `rsync -avzh --update --progress -e "ssh -o 'ControlPath=/tmp/ssh-socket-2'" testCluster root@10.190.3.786:/mnt/testCluster/` ===> This will transfer data to another cluster.
* `sudo rsync -av /etc/ ~/etc-backup/` backup files recursively. ending / is mandatory, otherwise it will copy in current directory file rather than etc directory
* `sudo rsync -aq /etc/ ~/etc-backup/` ---> `q` don't show anything in terminal log
* `sudo rsync -av --delete /etc/ ~/etc-backup/` ---> this can sync deleted files
* `sudo rsync -av --exclude-from-'/home/student/exclude_files.txt' /etc/ ~/etc-backup/` ---> this can exclude anything which are defined in this file
* `sudo rsync -av -e ssh /etc/ student@192.168.0.20:~/etc-backup/` ---> It will back up to remote server data

`rsync -avP /test/test-directory/db-dump/ictd/20240822 root@10.12.5.196:/scripts/` transfer data to remote server
