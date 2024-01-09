#!/bin/bash
DIR_PREFIX=`pwd`
CONTAINER=media_server
VERSION="0.0.2"
IMAGE=${CONTAINER}:${VERSION}
docker stop ${CONTAINER}
docker rm ${CONTAINER}
docker run -d --net=host \
              --name=${CONTAINER} \
              -v ${DIR_PREFIX}/upload:/go/upload \
              -v ${DIR_PREFIX}/public:/go/public \
	      -v /root/.acme.sh/pbx.mango.band_ecc/:/tls \
	      ${IMAGE}
              # tail -f /dev/null
