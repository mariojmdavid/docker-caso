#!/bin/bash

IMAGE="mariojmdavid/caso"

mkdir -p /etc/caso \
         /etc/apel \
         /var/spool/caso \
         /var/spool/apel/outgoing/openstack \
         /var/log/caso \
         /var/log/apel

cp run-caso.sh run-ssmsend.sh /usr/local/bin/
cp voms.json caso.conf /etc/caso/
cp sender.cfg /etc/apel/

if  [ -z $(docker images -q ${IMAGE}) ]
then
  echo "Pulling ${IMAGE}"
  docker pull ${IMAGE}
fi

cp caso.cron /etc/cron.d/caso
cp ssmsend.cron /etc/cron.d/ssmsend

