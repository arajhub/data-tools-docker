#!/usr/bin/env bash


function startWorker ()
{
  su - aaraj -c "hadoop-daemon.sh start datanode"
  su - aaraj -c "yarn-daemon.sh start nodemanager"
}

################################  Entry point #####################################
touch /var/log/cluster.log
service sshd start
startWorker

echo '######################## HADOOP WORKER READY ########################' >> /var/log/cluster.log
echo '######################## HADOOP WORKER READY ########################'
while true; do sleep 5000; done