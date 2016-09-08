#!/bin/bash
#Filename:cmd.sh
#Function:
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-08

curl -XPUT 'http://localhost:9200/blogs?pretty' -d '
{
	"settings" : {
      "number_of_shards" : 3,
        "number_of_replicas" : 1
	   }
}
'

curl -XGET 'http://localhost:9200/_cluster/health?pretty'
