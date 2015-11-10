#!/bin/bash
#
# docker.sh
# Copyright (C) 2015 george
#
# Distributed under terms of the MIT license.
#

##
## base setting option
##

img_name="{{ project_name }}"
curr=`pwd`/src
docker_work_dir=/srv/work

## get docker hosting ip
if [ $DOCKER_HOST ];
then
    ip=`echo $DOCKER_HOST|sed 's/tcp:\/\///'|sed 's/:.*//'`
else
    ip="127.0.0.1"
fi

## get free port
for port in $(seq 8000 65000); do echo -ne "\035" | telnet $ip $port > /dev/null 2>&1; [ $? -eq 1 ]  && break; done;echo $port

docker_run="docker run -i -e PYTHONPATH=$docker_work_dir --rm -p $port:$port -v $curr:$docker_work_dir -w $docker_work_dir -t $img_name"
##
## initialize docker env
##



case $1 in
    "test" )
        $docker_run python manage.py test --settings=retail.test_settings
        ;;
    "build" )
        echo "start build"
        docker build -t $img_name .
        $docker_run python manage.py migrate
        ;;
    "run" )
        shift 1
        $docker_run $@
        ;;
    "runserver" )
        echo "server running at $ip:$port"
        shift 1
        $docker_run python manage.py runserver 0:$port
        ;;
esac



