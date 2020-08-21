#!/bin/bash

CMDDIR=$(dirname $0)
WEB_BASE=/var/www/speedtest

sudo apt update
#sudo apt install -y mysql-server
#echo 'Answer y to all following questions'
#sudo mysql_secure_installation

sudo apt install -y php-fpm php-mysql

# WEB_BASE=/var/www/speedtest
sudo mkdir -p $WEB_BASE
( cd $CMDDIR
sudo cp -r backend *.js $WEB_BASE/
sudo cp example-singleServer-pretty.html $WEB_BASE/index.html
sudo cp speedtest-nginx.conf /etc/nginx/sites-available/speedtest
sudo ln -sfn ../sites-available/speedtest /etc/nginx/sites-enabled/speedtest
)

sudo systemctl reload nginx
