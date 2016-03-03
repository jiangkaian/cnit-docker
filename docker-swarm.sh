#!/bin/bash

#该脚本的作用：自动搭建docker 1.9版本以上的swarm集群
#创建者：江开安


#创建文件cluster,并填写需要集群的主机的ip地址到文件cluste中

if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ]; then
    echo "error:too few parameters! pleasr input parameters like this >:\"sh $0 111.111.111.111 222.222.222.222 333.333.333.333\""
    exit 0
fi

if [ -f $(pwd)/cluster ]; then
  rm -rf  cluster
fi

touch cluster

echo -e "$1:2375" >> cluster
echo -e "$2:2375" >> cluster
echo -e "$3:2375" >> cluster

echo  "create file cluster successed!"

#在集群管理主机上执行swarm manage命令创建集群
docker run -d -p 3375:2375 -v $(pwd)/cluster:/tmp/cluster swarm manage file:///tmp/cluster

#查看集群结果
docker run --rm -v $(pwd)/cluster:/tmp/cluster swarm list file:///tmp/cluster

echo  "create swarm cluster completed!"
echo ""
