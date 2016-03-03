#!/bin/bash

#该脚本的作用：自动安装docker并配置启动服务
#创建者：江开安

#输入安装路径
if [ "$1" == "" ]; then
     echo "error:too few parameters! pleasr input setup-pathname like this:\"sh $0 /home\""
     exit 0
fi

echo "start setup docker......"

#配置docker安装的文件
if [ -f /etc/yum.repos.d/docker.repo ]; then
  rm -rf /etc/yum.repos.d/docker.repo
fi

touch /etc/yum.repos.d/docker.repo

echo -e "[docker-main-repo]" >> /etc/yum.repos.d/docker.repo
echo -e "name=Docker main Repository" >> /etc/yum.repos.d/docker.repo
echo -e "baseurl=https://get.daocloud.io/docker/yum-repo/main/centos/7" >> /etc/yum.repos.d/docker.repo
echo -e "enabled=1" >> /etc/yum.repos.d/docker.repo
echo -e "gpgcheck=1" >> /etc/yum.repos.d/docker.repo
echo -e "gpgkey=https://get.daocloud.io/docker/yum/gpg" >> /etc/yum.repos.d/docker.repo

#开始安装docker
yum install -y docker-engine

#配置docker启动服务
sed -i '9d' /usr/lib/systemd/system/docker.service
sed -i "8a ExecStart=/usr/bin/docker daemon -H fd:// -api-enable-cors -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock --graph=$1/docker" /usr/lib/systemd/system/docker.service

#关闭防火前
service firewalld stop
chkconfig firewalld off

#关闭selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#启动docker服务
systemctl daemon-reload
service docker restart
chkconfig docker on

#提示安装完成，并显示安装版本
echo ""
echo "--------docker setup successed!----------"
echo ""
docker -v
echo "Complete!"
echo ""

