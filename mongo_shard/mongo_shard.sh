#!/bin/bash
#Filename:mongo_shard.sh
#Function:start mongo cluster
#cluster:shard 
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-09

sudo docker run --name mongo-shard0  \
	-p 17017:27017 -p 18017:28017 \
	-v $HOME/data/mongo_shard0:/data/db \
	-d mongo --replSet testSet0 

sudo docker run --name mongo-shard1  \
	-p 17018:27017 -p 18018:28017 \
	-v $HOME/data/mongo_shard1:/data/db \
	-d mongo --replSet testSet0 

sudo docker run --name mongo-shard2  \
	--link mongo-shard0 --link mongo-shard1 \
	-p 17019:27017 -p 18019:28017 \
	-v $HOME/data/mongo_shard2:/data/db \
	-d mongo --replSet testSet0 

sudo docker run --name mongo-shard3  \
	-p 17020:27017 -p 18020:28017 \
	-v $HOME/data/mongo_shard3:/data/db \
	-d mongo --replSet testSet1 


sudo docker run --name mongo-shard4  \
	-p 17021:27017 -p 18021:28017 \
	-v $HOME/data/mongo_shard4:/data/db \
	-d mongo --replSet testSet1 

sudo docker run --name mongo-shard5  \
	-p 17022:27017 -p 18022:28017 \
	-v $HOME/data/mongo_shard5:/data/db \
	-d mongo --replSet testSet1 



#connect to it from an application
#sudo docker run --name some-app --link mongo:mongo \
#	-d application-that-uses-mongo

#via mongo
#docker run -it --link mongo --rm mongo \
#	sh -c 'exec mongo "mongo:20717/test"'
