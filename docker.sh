#!/bin/sh

container=centos-java9
image=centos:latest

function docker_init() {
  docker run -d \
    --name $container \
    -v /home/dagui/docker/java/$container:/work \
    $image \
    /bin/sh -c 'while true; do sleep 1; done'
}

if [ $# -eq 0 ];then
  set -- /bin/bash
fi

status=`docker inspect --format '{{.State.Status}}' $container 2>/dev/null`

if [ x"$status" = x"" ]; then
  docker_init
elif [ x"$status" = x"exited" ]; then
  docker start $container
fi

exec docker exec -it $container "$@"
