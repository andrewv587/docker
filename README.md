# docker
some soft cluster(redis,mongodb,elasticsearch...) build on docker

在docker中配置了redis,mongodb,elasticsearch等集群（主从模式、复本集模式）

说明:脚本环境运行在ubuntu中，docker命令均为sudo docker.

在其他linux环境下将sudo docker改为相关root权限运行的docker.
## redis（主从模式）
依赖redis镜像(docker pull redis)

###redis_start.sh  
启动redis-master redis-slave0 redis-slave1节点

redis-master 端口映射16379:6379 数据存储在$HOME/data/redis0中

redis-slave0 端口映射16380:6379 数据存储在$HOME/data/redis1中

redis-slave1 端口映射16381:6379 数据存储在$HOME/data/redis2中
###rm_redis.sh 
关闭redis-master redis-slave0 redis-slave1节点

## mongodb(主从模式) 
依赖mongo镜像(docker pull mongo)

###mongo_start.sh 
启动mongo-master mongo-slave0 mongo-slave1节点

mongo-master 端口映射 17017:27017 18017:28017 数据存储在$HOME/data/mongo0中

mongo-slave0 端口映射17018:27017 18018:28017 数据存储在$HOME/data/mongo1中

mongo-slave1 端口映射17019:27017 18019:28017 数据存储在$HOME/data/mongo2中

注意:终端连接slave时要首先运行rs.slaveOk()，才能实现从节点
###rm_mongo.sh 
关闭mongo-master mongo-slave0 mongo-slave1节点

##elasticsearch(分片模式)
依赖elasticsearch镜像(docker pull elasticsearch)

###elasticsearch_start.sh 
启动elastic0 elastic1 elastic2节点

elastic0 端口映射 无 数据存储在$HOME/data/elastic0中

elastic1 端口映射 无 数据存储在$HOME/data/elastic1中

elastic2 端口映射 无 数据存储在$HOME/data/elastic2中

注意：elasticsearch采用的是docker中的--net host模式，端口为9200,9300
###rm_elastic.sh 

关闭elastic0 elastic1 elastic2节点




 

