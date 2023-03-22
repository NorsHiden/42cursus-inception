#!/bin/bash

# Set up WordPress

mkdir -p /run/php

chown www-data:www-data /var/www/html

wp core download --allow-root --path=/var/www/html

sed -i 's/\/run\/php\/php7\.3-fpm\.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core config --allow-root --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb

wp core install --allow-root --path=/var/www/html --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --ftp_host=ftp --ftp_user=$FTP_USER --ftp_pass=$FTP_PASS

wp --allow-root plugin install redis-cache --activate --path=/var/www/html

php-fpm7.3 -R -F