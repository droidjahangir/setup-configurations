# postgres
U3m$7*`)S&|k}
### installation guide
Official documentation for postgres sql installation guide https://www.postgresql.org/download/linux/ubuntu/#apt

```shell
sudo apt install curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt update
sudo apt -y install postgresql
```

* access terminal `sudo -u postgres psql`
* check version `SELECT version();`
* quite from postgres console `\q`

Alter super user password
```shell
ALTER USER postgres WITH PASSWORD 'U3m$7*`)S&|k}';
```

Create a new user
```shell
CREATE USER nidhi WITH PASSWORD 'Nidhi@1324';
```


