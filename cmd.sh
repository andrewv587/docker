#!/bin/bash
#Filename:cmd.sh
#Function:
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-08
#mongo localhost:17019/admin --eval "cfg={ _id:'testSet0', 
#members:[ 
#	{_id:0,host:'172.17.0.4:27017',priority:2},
#	{_id:1,host:'172.17.0.2:27017',priority:1},   
#	{_id:2,host:'172.17.0.3:27017',arbiterOnly:true}] };
#rs.initiate(cfg);"
#	
#mongo localhost:17022/admin --eval "cfg={ _id:'testSet1', 
#members:[ 
#	{_id:0,host:'172.17.0.7:27017',priority:2},
#	{_id:1,host:'172.17.0.5:27017',priority:1},   
#	{_id:2,host:'172.17.0.6:27017',arbiterOnly:true}] };
#rs.initiate(cfg);"

#mongo 172.17.0.11:40000/admin --eval "" 
curl -XPUT 'http://localhost:9200/blogs?pretty' -d '
{
	"settings" : {
      "number_of_shards" : 3,
        "number_of_replicas" : 1
	   }
}
'
#
#curl -XGET 'http://localhost:9200/_cluster/health?pretty'
