# cnit-docker
一、docker的自动安装脚本(docker-setup.sh)

    运行该脚本时，请提docker供需要安装的工作目录,如："sh docker-setup.sh /home",就是说嘛/home做为
    docker的工作目录。安装完成后进入到/home目录下就会看到多了一个目录docker（/home/docker）。
    docker的资源管理全部在该目录下进行。

    只要运行该脚本，docker的基本配置全部搞定。包括远程api的调度也配置好。

二、docker集群的配置（swarm集群）脚本（docker-swarm.sh)

    swarm集群的搭建有两种方法:token方法和file方法。该脚本才用file方式搭建，因为file的方式搭建
    会更加的见的化。

    运行该脚本需要提供3台集群主机的ip地址（该脚本时针对3台主机集群而写的）。运行时的格式如下：
    sh docker-swarm.sh 111.111.111.111 222.222.222.222 333.333.333.333

三、cnit-centos目录
 
    基于centos基本的镜像编写的dockerfile.安装了一些常用的工具和软件。

    说明：用该镜像启动的容器间不能使用ssh连接。

四。sshd-centos目录

    基于centos基本的镜像编写的dockerfile.安装了一些常用的工具和软件。同时配置了ssh服务。

    说明：用该镜像启动的容器能使用ssh连接！！！！！
