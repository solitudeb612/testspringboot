#!/bin/bash
echo "上传远程服务器成功"

#镜像名：自定义
imageNAME="test"
#该端口为Docker内部端口：（项目运行在docker中，项目中写清楚端口号）
PORT=8080
#容器1：使用镜像包启动的容器名称，数量自定义，我是使用一个镜像启动3个容器
CONNAME1="test"


pwd
ls -l

#切换到 /home/ubuntu/cmms/lib 目录
#此目录为jenkins打包后发送文件目录,目录结构如下
#cmms-receiver-2.0-RELEASE.jar
#classes/Dockerfile
cd /root/docker
ls -l



#强制删除已有容器1
{ # try
  docker rm  -f  ${CONNAME1}
} || { # catch
  echo "容器1不存在"
}


#强制删除镜像
{ # try
  docker image rm  -f  ${imageNAME}
} || { # catch
  echo "镜像不存在"
}


#构建镜像
echo "开始构建镜像文件"
docker build -t ${imageNAME} .
echo "构筑镜像结束"

#创建并运行容器1：参数-p 8111:{port} 其中8111是容器暴露端口，自定义即可
docker run --name ${CONNAME1} -d -p 50000:${port} ${imageNAME}
echo "创建容器$CONNAME1成功"

