#!/bin/bash
#Filename:rm_redis.sh
#Function:rm redis cluster
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-09

sudo docker stop redis-shard0
sudo docker stop redis-shard1
sudo docker stop redis-shard2
sudo docker stop redis-shard3
sudo docker stop redis-shard4
sudo docker stop redis-shard5
sudo docker rm redis-shard0
sudo docker rm redis-shard1
sudo docker rm redis-shard2
sudo docker rm redis-shard3
sudo docker rm redis-shard4
sudo docker rm redis-shard5

