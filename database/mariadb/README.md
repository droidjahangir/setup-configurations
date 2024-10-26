# Mariadb

Installation guid from official documentation

```shell
curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | sudo bash -s -- --mariadb-server-version="mariadb-11.5.2"
apt update
apt install apt install mariadb-server

# check status
systemctl status mariadb.service
```

### Restore database
```shell
zcat ministry_staging_2024_09_25.sql.gz | mysql -u root -p
```

/ssl_all/cert/dam_ssl/__dam_gov_bd.crt
/ssl_all/cert/dam_ssl/privkey.pem
