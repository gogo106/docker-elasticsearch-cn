# elasticsearch-cn-out-of-box Dockerfile
[elasticsearch-cn-out-of-box](https://github.com/hangxin1940/elasticsearch-cn-out-of-box) 的docker镜像

## 基础镜像
java:openjdk-7-jre

## 获取方式

`docker pull hangxin1940/docker-elasticsearch-cn-out-of-box`

# 快速部署

均使用默认配置:

    docker run -d -p 9200:9200 -p 9300:9300 hangxin1940/docker-elasticsearch-cn-out-of-box

# 集群部署

运行一个集群(3个节点):

    docker run -d -p 9200:9200 -p 9300:9300 hangxin1940/docker-elasticsearch-cn-out-of-box
    docker run -d -p 9201:9200 -p 9301:9300 hangxin1940/docker-elasticsearch-cn-out-of-box
    docker run -d -p 9202:9200 -p 9302:9300 hangxin1940/docker-elasticsearch-cn-out-of-box

# 配置

在 `docker run` 后面加上环境变量参数 (`-e`)来配置参数,如下:

    docker run ... -e NAME=VALUE ... hangxin1940/docker-elasticsearch-cn-out-of-box

## 集群名

`CLUSTER`的值将会被设置为集群名,默认为 "elasticsearch":

    -e CLUSTER=dockers
    
## 节点名

如下,指定一个节点名:

    -e NODE_NAME=Docker

## Zen单播发现机制

物理集群中, 多播在物理网络上可能不支持. 此时可以在集群中向单个或多个主机发送单播请求来实现节点的自动发现机制. 
`UNICAST_HOSTS` 的值是以`HOST:PORT` 列表形式的主机列表:

    -e UNICAST_HOSTS=HOST:PORT[,HOST:PORT]

如:

    -e UNICAST_HOSTS=192.168.0.100:9300

## 绑定节点交互地址

设置其它节点与之交互的地址, 虚拟机网络是隔离的, elasticsearch可能会发布一个容器内部的ip地址,这里可以绑定为一个真实的物理地址:

    -e PUBLISH_AS=DOCKERHOST:9301
