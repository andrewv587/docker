#!/bin/bash
#Filename:rm_mongo.sh
#Function:rm mongos created by
#mongo_start.sh
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-08

sudo docker stop mongo-master
sudo docker stop mongo-slave0
sudo docker stop mongo-slave1
sudo docker rm mongo-master
sudo docker rm mongo-slave0
sudo docker rm mongo-slave1

