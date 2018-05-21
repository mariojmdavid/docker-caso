#!/bin/bash

IMAGE="mariojmdavid/caso"
CONT="caso"

mkdir -p /etc/caso \
         /etc/apel \
         /var/spool/caso \
         /var/spool/apel/outgoing/openstack \
         /var/log/caso \
         /var/log/apel

cp run-caso.sh run-ssmsend.sh /usr/local/bin/
cp voms.json caso.conf /etc/caso/
cp sender.cfg /etc/apel/

CACERT="/etc/certs/caroot.pem"
CERT="/etc/grid-security/apelcert.pem"
KEY="/etc/grid-security/apelkey.pem"

CONT_VOLS="-v /etc/caso:/etc/caso \
           -v /etc/apel:/etc/apel \
           -v /var/spool/caso:/var/spool/caso \
           -v /var/spool/apel/outgoing/openstack:/var/spool/apel/outgoing/openstack \
           -v /var/log/caso:/var/log/caso \
           -v /var/log/apel:/var/log/apel \
           -v ${CACERT}:${CACERT} \
           -v ${CERT}:${CERT} \
           -v ${KEY}:${KEY}"

if  [ -z $(docker images -q ${IMAGE}) ]
then
  echo "Pulling ${IMAGE}"
  docker pull ${IMAGE}
fi

if [ ! "$(docker ps -a | grep ${CONT})" ]
then
  echo "Creating container"
  docker run --name ${CONT} ${CONT_VOLS} ${IMAGE}
fi

cp caso.cron /etc/cron.d/caso
cp ssmsend.cron /etc/cron.d/ssmsend


