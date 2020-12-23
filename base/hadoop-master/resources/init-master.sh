#!/usr/bin/env bash


function startMaster ()
{
  su - aaraj -c "hadoop-daemon.sh start namenode"
  #su - aaraj -c "hadoop-daemon.sh start datanode"
  su - aaraj -c "yarn-daemon.sh start resourcemanager"
  #su - aaraj -c "yarn-daemon.sh start nodemanager"
  su - aaraj -c "mr-jobhistory-daemon.sh start historyserver"
  #TODO: Not working
  #su - aaraj /opt/cluster/spark/sbin/start-all.sh
  sleep 2
  su - aaraj -c "hive --service metastore" &
  sleep 2
  if [ "${HIVE_DEBUGLOG}" = true ]; then
    su - aaraj -c "hive --service hiveserver2 --hiveconf hive.root.logger=DEBUG" &
  else
    su - aaraj -c "hive --service hiveserver2 --hiveconf hive.root.logger=INFO" &
  fi
  sleep 5
  #TODO: Not working
  #su - aaraj  /opt/cluster/spark/sbin/start-history-server.sh

}

################################  Entry point #####################################
touch /var/log/cluster.log
service sshd start
startMaster

echo '######################## HADOOP READY ########################' >> /var/log/cluster.log
echo '######################## HADOOP READY ########################'
while true; do sleep 5000; done