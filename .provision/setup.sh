#!/bin/bash

echo "Provisioning virtual machine..."

echo "Installing Updates"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update

echo "Installing Nginx"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y nginx > /dev/null

echo "Configuring Nginx"
sudo cp /var/www/.provision/config/localhost /etc/nginx/sites-available/localhost > /dev/null
sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
sudo rm -rf /etc/nginx/sites-available/default
sudo service nginx restart > /dev/null

echo "Preparing MySQL"
export DEBIAN_FRONTEND=noninteractive
apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password test"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password test"

echo "Installing MySQL"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y mysql-server > /dev/null

echo "Installing PHP"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y php-fpm php-mysql > /dev/null

echo "All done!"