#!/bin/bash

IMAGE="audit_tools"

cp ~/.ssl/cadcproxy.pem .

mkdir -p ./collectionAuditing

sudo docker run --rm --user $(id -u):$(id -g) -e HOME=/app -v ${HOME}:/app ${IMAGE} ${@}
