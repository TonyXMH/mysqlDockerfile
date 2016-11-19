#名称：容器化的mysql
#用途：用作后端数据持久化服务
#创建时间：2016年11月19日
#基础镜像为centos
FROM centos
#维护者信息
MAINTAINER Tony 445241843@qq.com
#定义工作目录
WORKDIR /root/
#安装wget下载工具
RUN yum -y install wget
#安装mysql的源
RUN wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
RUN rpm -ivh /root/mysql-community-release-el7-5.noarch.rpm
#安装Mysql服务
RUN yum -y install mysql-server
#创建一个数据库
RUN mysql_install_db --user=mysql

