FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/ftp.sh /ftp.sh

RUN chmod +x /ftp.sh
RUN mkdir -p /var/run/vsftpd && mkdir -p /var/run/vsftpd/empty

CMD ["./ftp.sh"]
