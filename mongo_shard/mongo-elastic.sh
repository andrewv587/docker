#!/bin/bash
#Filename:mongo-elastic.sh
#Function:connect with elastic
#Author:Huang Weihang
#Email:huangweihang14@mails.ucas.ac.cn
#Data:2016-09-10

mongo-connector -m localhost:40000 -t localhost:9200 -d elastic2_doc_manager

