#!/bin/bash
#Filename:redis_start.sh
#Function:start redis_docker
#cluster:master-slave architecture
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-07

sudo docker run --name redis-master -p 16379:6379\
	-v $HOME/data/redis0:/data \
	-d redis redis-server  --appendonly yes
#-v $HOME/docker/redis.conf:/usr/local/etc/redis/redis.conf \

sudo docker run --name redis-slave0 --link redis-master -p 16380:6379\
	-v $HOME/data/redis1:/data \
	-d redis redis-server  --appendonly yes --slaveof redis-master 6379

sudo docker run --name redis-slave1 --link redis-master -p 16381:6379\
	-v $HOME/data/redis2:/data \
	-d redis redis-server  --appendonly yes --slaveof redis-master 6379

#connect to it from an application
#docker run --name some-app --link master-redis:redis \
#	-d application-that-uses-redis

#via redis-cli
#docker run -it --link master-redis:redis \
#	--rm redis redis-cli -h redis -p 6379

