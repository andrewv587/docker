#!/bin/bash
#Filename:rm_elastic.sh
#Function:rm elastics created by 
#elasticsearch_start.sh
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-08

sudo docker stop elastic0
sudo docker stop elastic1
sudo docker stop elastic2
sudo docker rm elastic0
sudo docker rm elastic1
sudo docker rm elastic2

