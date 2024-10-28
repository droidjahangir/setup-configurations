### Install necessary packages for apache2

Download apache `https://httpd.apache.org/download.cgi` or install using apt package manager
```shell
apt install apache2 apache2-docs apache2-utils
```

Default configuration file for apache2 `/etc/apache2`

* Enable apache `a2ensite <domain_name>`
* Protect site from ddos attack, install this module `mod_evasive`
* Hide OS info and apache version `ServerSignature off` and `ServerTokens Prod`
* 

