#!/bin/bash
#Filename:mongo_start.sh
#Function:create mongo cluster
#cluster:master-slave
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-08

sudo docker run --name mongo-master -p 17017:27017 -p 18017:28017 \
	-v $HOME/data/mongo0:/data/db \
	-d mongo \
	--master 
	
sudo docker run --name mongo-slave0 -p 17018:27017 -p 18018:28017 \
	--link mongo-master \
	-v $HOME/data/mongo1:/data/db \
	-d mongo \
	--slave  --source mongo-master:27017

sudo docker run --name mongo-slave1 -p 17019:27017 -p 18019:28017 \
	--link mongo-master \
	-v $HOME/data/mongo2:/data/db \
	-d mongo \
	--slave  --source mongo-master:27017

#connect to it from an application
#sudo docker run --name some-app --link mongo:mongo \
#	-d application-that-uses-mongo

#via mongo
#docker run -it --link mongo --rm mongo \
#	sh -c 'exec mongo "mongo:20717/test"'
