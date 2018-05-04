#!/bin/bash

# 当前文件路径
APP_NAME=web-crawler
CURRENT_PATH=$(cd `dirname $0`; pwd)
TOMCAT_PATH=${CURRENT_PATH}/apache-tomcat-9.0.7/
WORKSPACE_PATH=${CURRENT_PATH}/workspace/
echo init config project : ${APP_NAME}
#echo 当前路径${CURRENT_PATH}
echo tomcat目录${TOMCAT_PATH}
echo 当前workspace路径是：${WORKSPACE_PATH}

#Server port="8005"
#Connector port="8080"
#Connector port="8009"
sed -i 's/Server port="8005"/Server port="8125"/g' ${TOMCAT_PATH}conf/server.xml
sed -i 's/Connector port="8080"/Connector port="8182"/g' ${TOMCAT_PATH}conf/server.xml
sed -i 's/Connector port="8009"/Connector port="8129"/g' ${TOMCAT_PATH}conf/server.xml
echo 完成端口号修改

mkdir ${TOMCAT_PATH}conf/Catalina
mkdir ${TOMCAT_PATH}conf/Catalina/localhost
touch ${TOMCAT_PATH}conf/Catalina/localhost/ROOT.xml
echo  '<Context reloadable="true" docBase="'${WORKSPACE_PATH}${APP_NAME}'" />' >${TOMCAT_PATH}conf/Catalina/localhost/ROOT.xml
