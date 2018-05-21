#!/bin/bash

#IMAGE="mariojmdavid/caso"
IMAGE="caso"
CONT="caso"

if  [ -z $(docker images -q ${IMAGE}) ]
then
  echo "Pulling ${IMAGE}"
  docker pull ${IMAGE}
fi



if [ ! "$(docker ps -a | grep ${CONT})" ]
then
  echo "Creating container"
  docker run --name ${CONT} ${IMAGE}
fi

cp run-caso.sh run-ssmsend.sh /usr/local/bin/
cp caso.cron /etc/cron.d/caso
cp ssmsend.cron /etc/cron.d/ssmsend


