#!/bin/bash
#Filename:rm_redis.sh
#Function:remove redis created by
#reids_start.sh
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-08

sudo docker stop redis-master
sudo docker stop redis-slave0
sudo docker stop redis-slave1
sudo docker rm redis-master
sudo docker rm redis-slave0
sudo docker rm redis-slave1

