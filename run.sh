#!/bin/sh

DATA_CONTAINER=$(docker ps -a |grep nexus_data |wc -l)
if [ "$DATA_CONTAINER" -ne "1" ]; then
  docker run -v /opt/sonatype-work --name nexus_data busybox true
fi

docker run -d -p 8081:8081 --volumes-from nexus_data --name nexus gzockoll/nexus
