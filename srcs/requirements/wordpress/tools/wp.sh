#!/bin/bash

# Set up WordPress

mkdir -p /run/php
mkdir -p /var/www/html

chown www-data:www-data /var/www/html

su www-data -s /bin/bash -c "wp core download --path=/var/www/html"

sed -i 's/\/run\/php\/php7\.3-fpm\.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

su www-data -s /bin/bash -c "wp core config --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb"

su www-data -s /bin/bash -c "wp core install --path=/var/www/html --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL"

su www-data -s /bin/bash -c "wp plugin install redis-cache --activate --path=/var/www/html"

su www-data -s /bin/bash -c "wp config set FS_METHOD direct --type=constant --path=/var/www/html"
su www-data -s /bin/bash -c "wp config set WP_REDIS_HOST redis --type=constant --path=/var/www/html"
su www-data -s /bin/bash -c "wp config set WP_REDIS_PORT 6379 --type=constant --path=/var/www/html"
su www-data -s /bin/bash -c "wp config set WP_CACHE true --type=constant --path=/var/www/html"

su www-data -s /bin/bash -c "wp plugin install redis-cache --activate --path=/var/www/html"
su www-data -s /bin/bash -c "wp redis enable --path=/var/www/html"

php-fpm7.3 -R -F