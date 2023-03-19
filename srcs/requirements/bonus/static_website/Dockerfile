FROM debian:buster

RUN apt-get update && apt-get install -y nodejs npm

COPY tools/html /var/www/html

RUN mkdir /webserv

COPY tools/deps/index.js /webserv

WORKDIR /webserv

RUN npm install express

CMD ["node", "index.js"]