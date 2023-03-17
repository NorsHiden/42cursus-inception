FROM debian:buster

# Install required packages
RUN apt-get update && \
    apt-get install -y curl mariadb-client nginx php-curl php-fpm php-gd php-mbstring php-mysql php-xml php-zip && \
    rm -rf /var/lib/apt/lists/*

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY tools/wp.sh /wp.sh

RUN chmod +x /wp.sh

# # Set up WordPress
# RUN mkdir -p /var/www/html && \
#     chown www-data:www-data /var/www/html && \
#     cd /var/www/html && \
#     wp core download --allow-root

# RUN sed -i 's/\/run\/php\/php7\.3-fpm\.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# RUN mkdir -p /run/php

# CMD ["php-fpm7.3", "-R", "-F"]
CMD ["bash", "wp.sh"]
# CMD ["bash"]