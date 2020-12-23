FROM mariadb:10.1.20

MAINTAINER Aaditya <xyz@hadoop.com>

USER root

RUN  mkdir -p /db/hive


COPY db/hive  /db/hive

COPY my.cnf /etc/mysql/
COPY db-scripts-runner.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/db-scripts-runner.sh
ENTRYPOINT ["db-scripts-runner.sh"]


EXPOSE 3306
#CMD ["mysqld"]
