#! /bin/bash
echo ">>>>> Spring Boot Shell By Niu <<<<<<"
echo

# 当前目录
CURRENT_PATH=$(cd `dirname $0`; pwd)
# jar文件绝对路径
APP=$CURRENT_PATH/$1

# 判断文件是否存在
if [ ! -f $APP ]; then
        echo $APP 'is not exists!!!!'
        exit
fi

# 判断文件是否为jar文件
if [[ $1 != *.jar ]] ; then
        echo $1 'is not a jar package'
        exit
fi

pid=''

# 获得pid
getPid(){
	pid=`ps -ef | grep $APP | grep -v grep | grep -v kill | awk '{print $2}'`
}

# status
status(){
	getPid
	if [[ ${pid} ]]; then
        	echo  $APP 'is running pid =' $pid
	else
        	echo $APP 'is NOT running'
	fi
}

# start
start(){
	rm -f $CURRENT_PATH/pid
	nohup java -jar $APP --spring.config.location=./application.properties > /dev/null 2>&1 &
	echo $! > $CURRENT_PATH/pid
	status
}

# stop
#  TODO 如果不在运行不必执行kill命令
stop(){
	status
	if [[ ${pid} ]]; then
   		echo 'Stop Process...'
   		kill -15 $pid
		sleep 4
	fi
	sleep 1
	getPid
	if [[ ${pid} ]]; then
   		echo 'Kill Process!'
   		kill -9 $pid
	else
    	echo 'Stop Success!'
	fi
}

# restart
restart(){
	status
	if [[ ${pid} ]]; then
		stop
		status
	fi
	start
}

if [ "$2" = "status" ];then
	status
elif [  "$2" = "start" ];then
	start
elif [ "$2" = "stop" ];then
	stop
elif [ "$2" = "restart" ];then
	restart
else
	echo $2' : command not found'
fi

echo
echo ">>>>> Spring Boot Shell By Niu <<<<<<"
