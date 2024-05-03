#!/bin/bash

INSTALL_PREFIX="/opt/halo"

declare -a media_server_instances=("pbx.mango.band" "pbx.dead-orbit.com")

retreive_media_server_config() {
	ROLE="media_server"
	INSTALL_DIR="${INSTALL_PREFIX}/${ROLE}"
	for i in "${media_server_instances[@]}"
	do
		if [ "$1" != "all" ] && [ "$1" != "$i" ] ; then continue; fi
		printf "\ndownloading from [$i]\n"
		scp $i:$INSTALL_DIR/* .
		scp $i:$INSTALL_DIR/public/* public/
		scp $i:$INSTALL_DIR/public/softphone/* public/softphone
		done
}

instruction() {
	printf  "\nYou can specify a host name :\n\n"
	for i in "${media_server_instances[@]}"
	do
		echo "./retreive.sh $i"
	done
}

TARGET=pbx.mango.band
TARGET="$1"
if [ "${TARGET}" == "" ]
then
	instruction
	exit
fi

retreive_media_server_config $TARGET
