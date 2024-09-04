#!/bin/bash
sudo add-apt-repository ppa:ondrej/php

apt update

sudo apt install software-properties-common

sudo apt install apache2

sudo apt install  php5.6

sudo apt install php5.6-gd php5.6-mysql php5.6-imap php5.6-curl php5.6-intl php5.6-pspell php5.6-recode php5.6-sqlite3 php5.6-tidy php5.6-xmlrpc php5.6-xsl php5.6-zip php5.6-mbstring php5.6-soap php5.6-opcache libicu65 php5.6-common php5.6-json php5.6-readline php5.6-xml php5.6-cli

sudo a2enmod php5.6

sudo a2enmod rewrite

systemctl restart apache2


sudo apt-get install  libpcre3-dev git  gcc make re2c php5.6-dev libapache2-mod-php5.6


 git clone https://github.com/phalcon/cphalcon.git

 cd cphalcon/

 git checkout phalcon-v1.3.4

cd build

sudo ./install

echo "extension=phalcon.so" > /etc/php/5.6/mods-available/phalcon.ini

sudo phpenmod -v 5.6 phalcon

systemctl restart apache2