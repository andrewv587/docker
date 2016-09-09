#!/bin/bash
#Filename:elasticrearch_start.sh
#Function:start elasticresearch
#cluster:peer architecture
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-08
#!/bin/bash

#expose port: 9200 9300
sudo docker run --name elastic0 \
	--net host \
	--oom-kill-disable=true \
	-m 1024M \
	-v $HOME/data/esdata0:/usr/share/elasticsearch/data \
	-d elasticsearch \
	-Des.node.name="TestNode0" -Des.cluster.name="TestCluster" \
	-Des.http.port=9200 -Des.http.transport.tcp.port=9300

sudo docker run --name elastic1 \
	--net host \
	--oom-kill-disable=true \
	-m 1024M \
	-v $HOME/data/esdata1:/usr/share/elasticsearch/data \
	-d elasticsearch \
	-Des.node.name="TestNode1" -Des.cluster.name="TestCluster" \
	-Des.http.port=9201 -Des.http.transport.tcp.port=9301

sudo docker run --name elastic2  \
	--net host \
	--oom-kill-disable=true \
	-m 1024M \
	-v $HOME/data/esdata2:/usr/share/elasticsearch/data \
	-d elasticsearch \
	-Des.node.name="TestNode2" -Des.cluster.name="TestCluster" \
	-Des.http.port=9202 -Des.http.transport.tcp.port=9302 
