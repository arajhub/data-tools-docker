FROM com.pranee.docker/hadoop-cluster:latest

MAINTAINER Aaditya <xyz@hadoop.com>


EXPOSE 4040

ENV SPARK_HOME=/opt/cluster/spark
ENV SPARK_SCALA_VERSION=2.11
ENV PATH=${PATH}:${SPARK_HOME}/bin:${SPARK_HOME}/sbin

USER root

RUN rm -rf /opt/cluster/spark; \
    curl -v -L -b -O "http://ftp.heanet.ie/mirrors/www.apache.org/dist/spark/spark-2.4.6/spark-2.4.6-bin-hadoop2.7.tgz" > spark-2.4.6-bin-hadoop2.7.tgz; \
    tar xvf spark-2.4.6-bin-hadoop2.7.tgz; \
    rm spark-2.4.6-bin-hadoop2.7.tgz; \
    mkdir -p /opt/cluster/spark; \
    mv spark-2.4.6-bin-hadoop2.7/* /opt/cluster/spark; \
    cp /opt/cluster/spark/yarn/spark-2.4.6-yarn-shuffle.jar /opt/cluster/hadoop/share/hadoop/yarn; \
    rm -rf spark-2.4.6-bin-hadoop2.7; \
    rm -rf /opt/cluster/spark/lib/spark2/conf/*; \
    rm -rf /opt/cluster/spark/lib/spark2/work/*; \
    mkdir -p /opt/cluster/spark/logs; \
    chown aaraj -R /opt/cluster; \
    echo 'export SPARK_HOME=/opt/cluster/spark' >> /etc/profile; \
    echo 'export SPARK_SCALA_VERSION=2.11' >> /etc/profile; \
    echo 'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' >> /etc/profile; \
    source /etc/profile;

USER root

RUN mkdir -p /var/run/spark; \
    mkdir -p /var/log/spark; \
    chown -R aaraj:hadoop /var/run/spark; \
    chown -R aaraj:hadoop /var/log/spark; \
    chown -R aaraj:hadoop /opt/cluster/spark;

USER aaraj

COPY resources/etc/spark/* /opt/cluster/spark/conf/
COPY resources/etc/spark/* /opt/cluster/spark/conf/

	
ENV SPARK_DIST_CLASSPATH="$HIVE_HOME/lib/*:$HADOOP_HOME/etc/hadoop/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/tools/lib/*"

