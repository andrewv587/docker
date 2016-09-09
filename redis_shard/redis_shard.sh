#!/bin/bash
#Filename:redis_start.sh
#Function:start redis_docker
#cluster:master-slave architecture
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-07

sudo docker run --name redis-shard0  \
	--net host \
	-v $HOME/data/redis_shard0:/data \
	-d redis redis-server  --appendonly yes \
	--cluster-enabled yes --cluster-node-timeout 5000 \
	--port 7000

sudo docker run --name redis-shard1 \
	--net host \
	-v $HOME/data/redis_shard1:/data \
	-d redis redis-server  --appendonly yes \
	--cluster-enabled yes --cluster-node-timeout 5000 \
	--port 7001

sudo docker run --name redis-shard2  \
	--net host \
	-v $HOME/data/redis_shard2:/data \
	-d redis redis-server  --appendonly yes \
	--cluster-enabled yes --cluster-node-timeout 5000 \
	--port 7002

sudo docker run --name redis-shard3 \
	--net host \
	-v $HOME/data/redis_shard3:/data \
	-d redis redis-server  --appendonly yes \
	--cluster-enabled yes --cluster-node-timeout 5000 \
	--port 7003

sudo docker run --name redis-shard4  \
	--net host \
	-v $HOME/data/redis_shard4:/data \
	-d redis redis-server  --appendonly yes \
	--cluster-enabled yes --cluster-node-timeout 5000 \
	--port 7004

sudo docker run --name redis-shard5  \
	--net host \
	-v $HOME/data/redis_shard5:/data \
	-d redis redis-server  --appendonly yes \
	--cluster-enabled yes --cluster-node-timeout 5000 \
	--port 7005
#connect to it from an application
#docker run --name some-app --link master-redis:redis \
#	-d application-that-uses-redis

#via redis-cli
#docker run -it --link master-redis:redis \
#	--rm redis redis-cli -h redis -p 6379

