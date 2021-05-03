#!/bin/bash

# This will remove Apache
sudo service apache2 stop
sudo apt-get purge apache2 apache2-utils apache2.2-bin 
sudo apt remove apache2.*
sudo apt-get autoremove
whereis apache2
sudo rm -rf /etc/apache2

# This will remove PHP
sudo apt-get purge `dpkg -l | grep php7.2| awk '{print $2}' |tr "\n" " "`
sudo apt-get purge php7.*
sudo apt-get autoremove --purge
whereis php
sudo rm -rf /etc/php

# This will remove MYSql
sudo service mysql stop
sudo apt-get remove --purge *mysql\*
sudo apt-get remove --purge mysql-server mysql-client mysql-common -y
rm -rf /etc/mysql
sudo apt-get autoremove
sudo apt-get autoclean

sudo reboot

# Install MySQL & check version, start,stop & restart Apache
sudo apt install mysql-server
sudo mysql_secure_installation
mysql --version
sudo service mysql start
sudo service mysql enable
sudo service mysql start
sudo service mysql restart


# Create MySQL DB, User
sudo mysql
CREATE DATABASE mydb;
CREATE USER 'masum'@'localhost' IDENTIFIED WITH mysql_native_password BY '01722G@usia';
ALTER USER 'masum'@'localhost' IDENTIFIED WITH mysql_native_password BY '01722G@usia';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT on . TO 'masum'@'localhost' WITH GRANT OPTION;
use mydb;
FLUSH PRIVILEGES;
exit

# Install PHP & check version 
sudo apt-get install software-properties-common
sudo apt install php7.2-fpm php7.2-common php7.2-mbstring php7.2-xmlrpc php7.2-soap php7.2-gd php7.2-xml php7.2-intl php7.2-mysql php7.2-cli php7.2-zip php7.2-curl
php --version
sudo apt install mlocate
locate php
whereis php


# Install PHPmyAdmin
sudo apt update 
sudo apt install phpmyadmin 
sudo apt install -y php-mbstring
sudo apt-get install gettext

sudo service apache2 restart 
