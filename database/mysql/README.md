# Mysql 

## Installation Guide
Official documentation to install mysql : https://dev.mysql.com/doc/mysql-installation-excerpt/8.0/en/linux-installation.html

We can download mysql .deb file or install using apt

I prefer to install using apt
```shell
sudo apt-get install mysql-server
```

## Get root password
After installation mysql, a temporary password will be generated, we can get this password from this command
```shell
grep -i "A temporary password is generated" /var/log/mysqld.log
```

## Change root password
after using this temporary password we need to change root password using this command.
```shell
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
```

### Create mysql user

```shell
CREATE USER 'square_denims'@'localhost' IDENTIFIED BY 'y?ur-W132-SF?w';
CREATE DATABASE IF NOT EXISTS square_denim_db DEFAULT CHARACTER SET = 'utf8' DEFAULT COLLATE 'utf8_general_ci';
GRANT ALL PRIVILEGES ON square_denim_db.* TO square_denims@localhost WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

## Restrict mysql database access
* create user for specific ip address `CREATE USER 'testuser'@'<ip_add>' IDENTIFIED BY 'Mkj#$w@89LKJH#';`
* Grant specific access `GRANT SELECT, INSERT, UPDATE, DELETE ON appdb.* TO 'testuser'@'<ip_add>';`
* 

### Activate read-only mode
```shell
SET GLOBAL read_only = 1;

revert it to enable
SET GLOBAL read_only = 0;
```


## DB Backup
```shell
mysqldump --no-tablespaces --single-transaction -h localhost -u root -p --databases npf_polling npfministry npfministry_common npfministryadmin | gzip > ministry_staging_2024_09_25.sql.gz

# Install pv to get progress
mysqldump --no-tablespaces --single-transaction -h localhost -u root -p --databases npfministry npfministry_common | pv | gzip > ministry_2024_10_28.sql.gz
```

## Restore db backup

**restore zip file**
restore from this backup file
```shell
zcat db_staging_2024_09_25.sql.gz | mysql -u root -p
```

**restore sql file**
```shell
mysql -u username -p database_name < /path/to/yourfile.sql
```

## Transfer data
```shell
scp directorate_staging_2024_10_17.sql.gz root@131.186.51.772:/root/

```


## Crontab to make incremental backup

Open crontab file `crontab -e`
```shell
0 0 * * * /root/backup.sh
```

