#!/bin/bash

IMAGE="mariojmdavid/caso"
CONT="caso"
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

if [ ! "$(docker ps -a | grep ${CONT})" ]
then
  echo "Running container caso-extract"
  docker run --name ${CONT} ${CONT_VOLS} ${IMAGE} caso-extract
fi

docker rm caso

