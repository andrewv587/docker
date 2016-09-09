#!/bin/bash
#Filename:mongo_server.sh
#Function:
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-09
sudo docker run --name mongo-config0  \
	-p 17023:27019 -p 18023:28017 \
	-v $HOME/data/mongo_config0:/data/db \
	-d mongo --configsvr 

sudo docker run --name mongo-config1  \
	-p 17024:27019 -p 18024:28017 \
	-v $HOME/data/mongo_config1:/data/db \
	-d mongo --configsvr 

sudo docker run --name mongo-config2  \
	-p 17025:27019 -p 18025:28017 \
	-v $HOME/data/mongo_config2:/data/db \
	-d mongo --configsvr 

sudo docker run --name mongo-server0  \
	-p 40000:40000 \
	-v $HOME/data/mongo_server0:/data/db \
	-d mongo mongos --configdb \
	172.17.0.8:27019,172.17.0.9:27019,172.17.0.10:27019  \
	--port 40000

sudo docker run --name mongo-server1  \
	-p 40001:40000 \
	-v $HOME/data/mongo_server1:/data/db \
	-d mongo mongos --configdb \
	172.17.0.8:27019,172.17.0.9:27019,172.17.0.10:27019  \
	--port 40000
