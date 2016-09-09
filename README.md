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

## redis（分片模式）
脚本在redis_shard中

依赖redis镜像(docker pull redis)

机器需要预装redis(为获得redis-trib)

redis-trib依赖于ruby和gem install redis
###redis_shard.sh
在docker中创建redis-shard0,redis-shard1,...,redis-shard6节点

对应端口分别为7000,7001,...7005

数据存储在$HOME/data/redis_shard0,redis_shard1,...,redis_shard5

###redis_shard_config.sh
在第一次运行redis_shard.sh时，需要接着运行此脚本，用以初始化集群

###rm_redis.sh
关闭redis-shard0,redis-shard1,...,redis-shard6节点

注：利用redis-cli连接时需要加上-c命令，以表明连接分片集群

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

##mongodb（分片模式）
脚本在mongo_shard文件夹中

依赖mongo镜像(docker pull mongo)

机器需要预装mongo，用以利用mongo命令配置集群
###mongo_shard.sh 
在docker中创建mongo-shard0,mongo-shard1,...,mongo-shard6节点

对应端口分别为17017,17018,...17022

数据存储在$HOME/data/mongo_shard0,mongo_shard1,...,mongo_shard5

###mongo_shard_config.sh
第一次运行mongo_shard.sh时需要运行此脚本，对shard进行配置。

此脚本将6个节点按序分为复制集dataSet0和dataSet1,每个dataSet中有1个master，1个slave和1个orbiter.
###mongo_server.sh
在docker中创建config集群mongo-config1,mongo-config2,mongo-config3

对应端口分别为17023,17024,17025

数据存储在$HOME/data/mongo_config0,mongo_config1,mongo_shard2

server集群mongo-server0,mongo-server1，并连接到上面config集群中

对应端口分别为40000,40001

数据存储在$HOME/data/mongo_server0,mongo_server1

###mongo_server_config.sh
第一次运行mongo_server.sh时需要运行此脚本，将mongo_server连接到复制dataSet0和dataSet1中。

在集群中testdb.test中设置了分片,索引为id.

###rm_mongo.sh
关闭集群上的所有结节

注：在连接集群时需要将docker中的所有其他容器移除。因为本例默认节点按启动顺序从127.17.0.2端口依次递增。

连接集群时应该连接路由端口40000和40001.

##elasticsearch(分片模式)
依赖elasticsearch镜像(docker pull elasticsearch)

###elasticsearch_start.sh 
启动elastic0 elastic1 elastic2节点

elastic0 端口映射 9200：9200 9300：9300 数据存储在$HOME/data/elastic0中

elastic1 端口映射 9201：9200 9301：9300 数据存储在$HOME/data/elastic1中

elastic2 端口映射 9202：9200 9302：9300 数据存储在$HOME/data/elastic2中

注意：elasticsearch采用的是docker中的--net host模式
###rm_elastic.sh 

关闭elastic0 elastic1 elastic2节点






 

