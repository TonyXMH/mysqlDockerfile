#########################################################################
# File Name: build_table.sh
# Author: tony
# mail: 445241843@qq.com
# Created Time: 2016年11月19日 星期六 23时34分17秒
#########################################################################
#!/bin/bash
mysqld_safe &
sleep 3
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS' WITH GRANT OPTION;"
mysql -e "create database scores"
mysql -e "create table scores.name_score(name char(20) not null,score int not null)DEFAULT CHARSET=utf8"
mysql -e "insert into scores.name_score values('李明', 80),('张杰', 90), ('罗峰'， 95)"
