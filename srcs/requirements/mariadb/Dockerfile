FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools/m_db.sh /

RUN chmod +x /m_db.sh

CMD [ "/m_db.sh"]

