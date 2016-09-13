#!/bin/bash
#Filename:mongo_server_config.sh
#Function:
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-09
mongo localhost:40000/admin --eval \
	"db.runCommand( { addshard :
	'testSet0/172.17.0.2:27017,172.17.0.3:27017,172.17.0.4:27017'});"
	
mongo localhost:40000/admin --eval \
	"db.runCommand( { addshard :
	'testSet1/172.17.0.5:27017,172.17.0.6:27017,172.17.0.7:27017'});"

mongo localhost:40000/admin --eval \
	"db.runCommand( { enablesharding :'testdb'});
	db.runCommand( { shardcollection : 'testdb.test',key : {id: 1} } )"
