#!/bin/bash

# Update package list and upgrade packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install software-properties-common to manage PPAs
sudo apt-get install -y software-properties-common

# Add the PHP repository
sudo add-apt-repository ppa:ondrej/php -y

# Update package list after adding PHP repository
sudo apt-get update -y

# Install PHP and common extensions
PHP_VERSION="7.4"  # Change this to the desired PHP version (e.g., 7.4, 8.0, 8.1)
sudo apt-get install -y php$PHP_VERSION php$PHP_VERSION-cli php$PHP_VERSION-fpm php$PHP_VERSION-mbstring php$PHP_VERSION-xml php$PHP_VERSION-curl php$PHP_VERSION-zip php$PHP_VERSION-mysql php$PHP_VERSION-bcmath php$PHP_VERSION-gd php$PHP_VERSION-intl

# Install additional extensions as needed
sudo apt-get install -y php$PHP_VERSION-soap php$PHP_VERSION-ldap php$PHP_VERSION-imap

# Verify PHP installation
php -v

# Restart the web server if using Apache or Nginx with PHP-FPM
# Uncomment the relevant line based on your web server
# sudo systemctl restart apache2
# sudo systemctl restart nginx

echo "PHP $PHP_VERSION installation completed successfully!"
