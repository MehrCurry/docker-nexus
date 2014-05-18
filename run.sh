#!/bin/sh

docker run -d -p 8081:8081 --volumes-from nexus_data --name nexus gzockoll/nexus
