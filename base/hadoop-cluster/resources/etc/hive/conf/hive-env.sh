# HIVE_AUX_JARS_PATH={{HIVE_AUX_JARS_PATH}}
# JAVA_LIBRARY_PATH={{JAVA_LIBRARY_PATH}}
export HADOOP_CONF_DIR="${HADOOP_CONF_DIR:-"$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"}"
export HIVE_AUX_JARS_PATH=/opt/cluster/hive/lib/mysql-connector-java-8.0.17.jar:/opt/cluster/hive/lib/json-serde-1.3.8-jar-with-dependencies.jar
export HADOOP_CLIENT_OPTS="-Xmx1147483648 -Djava.net.preferIPv4Stack=true $HADOOP_CLIENT_OPTS"
