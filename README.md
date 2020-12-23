Steps to run Single node Hadoop cluster.
1. ./build-base.sh
2. ./build-hadoop-cluster.sh
3. ./build-hadoop-master.sh
4. ./build-hadoop-worker.sh
5. docker-compose up
6. NameNode : http://localhost:50070/dfshealth.html#tab-overview
7. DataNode: http://localhost:50075/datanode.html
8. For hive - login to namenode container switch user to aaraj and enter hive

TBD
