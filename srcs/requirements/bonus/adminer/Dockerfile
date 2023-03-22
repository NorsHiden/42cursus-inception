FROM debian:buster

RUN apt-get update && apt-get install -y wget php php-mysqli default-mysql-client php-mysql

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

RUN chown -R www-data:www-data /var/www/html/adminer.php

RUN chmod 755 /var/www/html/adminer.php

WORKDIR /var/www/html/

CMD ["php", "-S", "0.0.0.0:8080"]
