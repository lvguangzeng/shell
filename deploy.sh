#!/bin/bash
# 当前文件路径
CURRENT_PATH=$(cd `dirname $0`; pwd)
TOMCAT_PATH=${CURRENT_PATH}/apache-tomcat-9.0.7/
WORKSPACE_PATH=${CURRENT_PATH}/workspace/
echo 当前路径${CURRENT_PATH}
echo 当前workspace路径是：${WORKSPACE_PATH}

function mvUnzip(){
	appName=$1
	echo ${appName}
	backup_name=${CURRENT_PATH}/backup/${appName}_$(date +%T)
	echo 备份${WORKSPACE_PATH}${appName}下面的内容至${backup_name}
	mv ${WORKSPACE_PATH}${appName} ${backup_name}

	echo 解压war包输出到路径：${WORKSPACE_PATH}${appName}/
	unzip -oqd ${WORKSPACE_PATH}${appName} ${WORKSPACE_PATH}${appName}.war
}

echo '关闭tomcat服务器'
${TOMCAT_PATH}'bin/shutdown.sh'

echo '休眠3秒'
sleep 3

for i in 'web-crawler'
do
   echo $i
   mvUnzip $i
done

echo '休眠3秒'
sleep 3

echo '启动tomcat服务器'
${TOMCAT_PATH}'bin/shutdown.sh'
