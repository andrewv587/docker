#!/bin/bash
#Filename:mongo_server_config.sh
#Function:
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-09
mongo localhost:40000/admin --eval \
	"db.runCommand( { enablesharding :'news_sina'});
	db.runCommand( { shardcollection : 'news_sina.news_items',key : {id: 1} } )"
