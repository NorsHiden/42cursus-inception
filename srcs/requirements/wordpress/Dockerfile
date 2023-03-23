FROM debian:buster

# Install required packages
RUN apt-get update && \
    apt-get install -y curl php php-redis php-fpm php-mysql mariadb-client php-curl php-gd php-json php-mbstring php-xml php-zip sendmail

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY tools/wp.sh /wp.sh

RUN chmod +x /wp.sh

CMD ["bash", "wp.sh"]