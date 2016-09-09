#!/bin/bash
#Filename:rm_mongo_shard.sh
#Function:rm mongo_shard created by 
#mongo_shard.sh 
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-09
sudo docker stop mongo-shard0
sudo docker stop mongo-shard1
sudo docker stop mongo-shard2
sudo docker stop mongo-shard3
sudo docker stop mongo-shard4
sudo docker stop mongo-shard5
sudo docker stop mongo-config0
sudo docker stop mongo-config1
sudo docker stop mongo-config2
sudo docker stop mongo-server0
sudo docker stop mongo-server1
sudo docker rm mongo-shard0
sudo docker rm mongo-shard1
sudo docker rm mongo-shard2
sudo docker rm mongo-shard3
sudo docker rm mongo-shard4
sudo docker rm mongo-shard5
sudo docker rm mongo-config0
sudo docker rm mongo-config1
sudo docker rm mongo-config2
sudo docker rm mongo-server0
sudo docker rm mongo-server1
