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
 
ENV MYSQL_USER test
ENV MYSQL_PASS mypassword

#支持中文
ENV LC_ALL en_US.UTF-8
#创建数据库
ADD build_table.sh /root/build_table.sh
RUN chmod u+x /root/build_table.sh
RUN /root/build_table.sh

#暴露端口
EXPOSE 3306
#定义默认的启动命令
ADD run.sh /root/run.sh
RUN chmod u+x /root/run.sh
CMD /root/run.sh
