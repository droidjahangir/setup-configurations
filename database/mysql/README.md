# Mysql 

### Create mysql user

```shell
CREATE USER 'jcc_user'@'localhost' IDENTIFIED BY 'N#was|mnT';
CREATE DATABASE IF NOT EXISTS ems_web_jcc DEFAULT CHARACTER SET = 'utf8' DEFAULT COLLATE 'utf8_general_ci';
GRANT ALL PRIVILEGES ON ems_web_jcc.* TO jcc_user@localhost WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### Activate read-only mode
```shell
SET GLOBAL read_only = 1;

revert it to enable
SET GLOBAL read_only = 0;
```


## DB Backup
```shell
mysqldump --no-tablespaces --single-transaction -h localhost -u root -p --databases npf_polling npfministry npfministry_common npfministryadmin | gzip > ministry_staging_2024_09_25.sql.gz
```

## Restore db backup
restore from this backup file `zcat ministry_staging_2024_09_25.sql.gz | mysql -u root -p`

## Transfer data
```shell
scp directorate_staging_2024_10_17.sql.gz root@131.186.51.242:/root/
```