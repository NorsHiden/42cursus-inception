FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl genrsa -out /etc/ssl/private/certificate.key 2048
RUN openssl req -x509 -new -key /etc/ssl/private/certificate.key -out /etc/ssl/certs/certificate.crt -days 365 -nodes -subj "/CN=nelidris.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
# CMD ["bash"]
