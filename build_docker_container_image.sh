#!/bin/sh
cd ./files
DOCKERIMAGENAME=builder_live_clamav
cd $(dirname "$0")
#docker build --no-cache --pull -t $DOCKERIMAGENAME .
docker build -t $DOCKERIMAGENAME .
