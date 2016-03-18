#!/bin/sh

DATA_CONTAINER=$(docker ps -a |grep nexus_data |wc -l)
if [ "$DATA_CONTAINER" -ne "1" ]; then
  docker create -v /sonatype-work --name nexus_data gzockoll/nexus true
fi

docker run -d -p 8081:8081 --volumes-from nexus_data --name nexus gzockoll/nexus
