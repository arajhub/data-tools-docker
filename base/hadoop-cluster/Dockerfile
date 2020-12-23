FROM com.pranee.docker/jdk-1.8.222:latest

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

COPY resources/ssh/sshd_config /etc/ssh/

RUN groupadd hadoop; \
    adduser -G hadoop aaraj; \
    echo 'hadoop' | passwd aaraj --stdin; \
    usermod -aG wheel aaraj; \
    service sshd restart; \
    cd /opt; \
    mkdir -p /opt/cluster/hadoop; \
    mkdir -p /opt/cluster/hive_scripts; \
    mkdir -p /opt/cluster/hadoop/logs; \
    mkdir -p /opt/cluster/hive/logs; \
    mkdir -p /opt/cluster/native; \
    mkdir -p /opt/resources; \
    mkdir -p /var/run/hdfs-sockets; \
    chown -R aaraj:hadoop /var/run/hdfs-sockets; \
    curl -v -L -b -O "http://ftp.heanet.ie/mirrors/www.apache.org/dist/hadoop/common/hadoop-2.10.1/hadoop-2.10.1.tar.gz" > hadoop-2.10.1.tar.gz; \
    curl -v -L -b -O "http://ftp.heanet.ie/mirrors/www.apache.org/dist/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz" > apache-hive-2.3.7-bin.tar.gz;\
    tar xvf hadoop-2.10.1.tar.gz; \
    tar xvf apache-hive-2.3.7-bin.tar.gz; \
    rm hadoop-2.10.1.tar.gz; \
    rm apache-hive-2.3.7-bin.tar.gz; \
    mv hadoop-2.10.1/* /opt/cluster/hadoop; \
    mv apache-hive-2.3.7-bin/* /opt/cluster/hive; \
    rm -rf hadoop-2.10.1; \
    rm -rf apache-hive-2.3.7-bin.tar.gz; \
    chown aaraj -R /opt/cluster; \
    mkdir -p /opt/hadoop_data/hdfs/namenode; \
    mkdir -p /opt/hadoop_data/hdfs/datanode; \
    mkdir -p /opt/hadoop_data/hdfs/tmp; \
    chown aaraj:hadoop -R /opt/hadoop_data; \
    wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.17.tar.gz; \
    tar -xvf mysql-connector-java-8.0.17.tar.gz; \
    mv mysql-connector-java-8.0.17/mysql-connector-java-8.0.17.jar /opt/cluster/hive/lib; \
    rm -rf mysql-connector-java-8.0.17; \
    wget http://www.congiu.net/hive-json-serde/1.3.8/hdp23/json-serde-1.3.8-jar-with-dependencies.jar; \
    mv json-serde-1.3.8-jar-with-dependencies.jar /opt/cluster/hive/lib; \
    echo 'export HADOOP_HOME=/opt/cluster/hadoop' >> /etc/profile; \
    echo 'export HADOOP_INSTALL=$HADOOP_HOME' >> /etc/profile; \
    echo 'export HADOOP_YARN_HOME=$HADOOP_HOME' >> /etc/profile; \
    echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> /etc/profile; \
    echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> /etc/profile; \
    echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> /etc/profile; \
    echo 'export YARN_HOME=$HADOOP_HOME' >> /etc/profile; \
    echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native' >> /etc/profile; \
    echo 'export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> /etc/profile; \
    echo 'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> /etc/profile; \
    echo 'export HIVE_HOME=/opt/cluster/hive' >> /etc/profile; \
    echo 'export HIVE_CONF_DIR=/opt/cluster/hive/conf' >> /etc/profile; \
    echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$HIVE_HOME/bin' >> /etc/profile; \
    echo 'export LD_LIBRARY_PATH=/opt/cluster/native/:/usr/lib/jvm/jre/lib/amd64/server' >> /etc/profile; \
    echo 'export HADOOP_COMMON_LIB_NATIVE_DIR="/opt/cluster/native"' >> /etc/profile; \
    echo 'export HADOOP_OPTS="$HADOOP_OPTS -Djava.net.preferIPv4Stack=true -Djava.library.path=/opt/cluster/native:/usr/lib/jvm/jre/lib/amd64/server"' >> /etc/profile; \
    echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /etc/profile; \
    source /etc/profile;\
    chown -R aaraj:hadoop /opt/cluster;


    #install mysql and move to /opt/cluster/hive/lib
	#curl -v -L -b -O https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar > postgresql-9.4.1212.jar; \


COPY resources/ /opt/resources/
COPY resources/etc/hadoop/* /opt/cluster/hadoop/etc/hadoop/
COPY resources/lib/native/* /opt/cluster/native/

RUN mv /opt/resources /home/aaraj/; \
    mkdir -p /etc/hadoop/conf; \
    ln -s /opt/cluster/hadoop/etc/hadoop/core-site.xml  /etc/hadoop/conf/core-site.xml; \
    ln -s /opt/cluster/hadoop/etc/hadoop/hdfs-site.xml  /etc/hadoop/conf/hdfs-site.xml; \
    chown -R aaraj:hadoop /home/aaraj/resources;



USER aaraj

RUN source /etc/profile;\
    ln -s /opt/cluster/native/libnativetask.so.1.0.0 /opt/cluster/native/libnativetask.so; \
    ln -s /opt/cluster/native/libsnappy.so.1.1.3 /opt/cluster/native/libsnappy.so.1; \
    ln -s /opt/cluster/native/libsnappy.so.1.1.3 /opt/cluster/native/libsnappy.so; \
    ln -s /opt/cluster/native/libsnappy.so.1.1.3 /opt/cluster/hadoop/lib/native/libsnappy.so.1; \
    ln -s /opt/cluster/native/libsnappy.so.1.1.3 /opt/cluster/hadoop/lib/native/libsnappy.so; \
    ssh-keygen -t rsa -P "" -f $HOME/.ssh/id_rsa; \
    cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys; \
    chmod 0600 ~/.ssh/authorized_keys;
    #prepare hadoop
    #hadoop namenode -format; \
    #hadoop-daemon.sh start datanode; \
    #hadoop-daemon.sh start namenode; \
    #yarn-daemon.sh start resourcemanager; \
    #yarn-daemon.sh start nodemanager; \
    #mr-jobhistory-daemon.sh start historyserver; \
	#hadoop fs -mkdir /tmp; \
	#hadoop fs -mkdir -p /user/hive/warehouse; \
	#hadoop fs -chmod g+w /tmp; \
    #hadoop fs -chmod g+w /user/hive/warehouse; \
    #hadoop fs -mkdir -p /user/spark; \
    #hadoop fs -mkdir -p /user/spark/applicationHistory; \
    #hadoop fs -chmod 1777 /user/spark/applicationHistory;

USER root

RUN chown -R aaraj:hadoop /opt/cluster

USER root

COPY resources/etc/hive/conf/* /opt/cluster/hive/conf/

COPY resources/init.sh /opt/
COPY resources/supervisord.conf /etc/

RUN chmod +x /opt/init.sh

ENTRYPOINT ["/opt/init.sh"]

