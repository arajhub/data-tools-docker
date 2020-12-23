FROM com.pranee.docker/hadoop-cluster:latest

MAINTAINER Aaditya <xyz@hadoop.com>

EXPOSE 21050
EXPOSE 50070
EXPOSE 50075
EXPOSE 18081
EXPOSE 18080
EXPOSE 10000
EXPOSE 50010

EXPOSE 8088
EXPOSE 9000
EXPOSE 9092
EXPOSE 8020
EXPOSE 8042
EXPOSE 2222

ENV LD_LIBRARY_PATH=/opt/cluster/native:/usr/lib/jvm/jre/lib/amd64/server
ENV HADOOP_HOME=/opt/cluster/hadoop
ENV HIVE_HOME=/opt/cluster/hive
ENV HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
ENV YARN_CONF_DIR=${HADOOP_HOME}/etc/hadoop
ENV HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop

ENV HADOOP_YARN_HOME=${HADOOP_HOME}
ENV HADOOP_MAPRED_HOME=${HADOOP_HOME}
ENV HADOOP_COMMON_HOME=${HADOOP_HOME}

ENV PATH=${PATH}:${HADOOP_HOME}/sbin:${HADOOP_HOME}/bin:${HIVE_HOME}/bin


USER root

COPY resources/etc/hadoop/core-site.xml /opt/cluster/hadoop/etc/hadoop/

COPY resources/init-worker.sh /opt/

RUN chmod +x /opt/init-worker.sh

ENTRYPOINT ["/opt/init-worker.sh"]

