#!/bin/bash
#Filename:redis_shard_config.sh
#Function:config redis cluster
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-09

redis-trib.rb create --replicas 1 127.0.0.1:7000 127.0.0.1:7001 \
	127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005
