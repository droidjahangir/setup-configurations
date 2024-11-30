### Install necessary packages for apache2

Download apache `https://httpd.apache.org/download.cgi` or install using apt package manager
```shell
apt install apache2 apache2-docs apache2-utils
```

Default configuration file for apache2 `/etc/apache2`

[//]: # (* Enable apache `a2ensite <domain_name>`)
* Protect site from ddos attack, install this module `mod_evasive`
* Hide OS info and apache version `ServerSignature off` and `ServerTokens Prod`
* Enable site from site-available `ln -s /etc/apache2/sites-available/test-site.xyz.conf /etc/apache2/sites-enabled/`
* Test apache2 configuration `apache2ctl configtest`
* Test apache2 configuration `apache2ctl -S`

