FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
# CMD ["bash"]
