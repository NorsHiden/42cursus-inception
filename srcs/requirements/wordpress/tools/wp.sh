#!/bin/bash

# Set up WordPress
chown www-data:www-data /var/www/html

wp core download --allow-root --path=/var/www/html

sed -i 's/\/run\/php\/php7\.3-fpm\.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

php-fpm7.3 -R -F