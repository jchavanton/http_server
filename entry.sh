#!/bin/bash

if [ "$1" = "" ]; then
	PORT=4433
	CERT="/tls/fullchain.cer"
	KEY="/tls/pbx.mango.band.key"
	CMD="/main ${PORT} ${CERT} ${KEY}"
else
        CMD="$*"
fi

echo "Running [$CMD]"
exec $CMD
echo "exiting ..."
