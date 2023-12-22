#!/bin/bash
CURRENT_COMMIT=$1
CONTAINER="media_server"
VERSION="0.0.1"


docker build . -f Dockerfile -t ${CONTAINER}:${VERSION}
