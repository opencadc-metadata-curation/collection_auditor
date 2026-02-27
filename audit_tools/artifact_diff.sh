#!/bin/bash

IMAGE="opencadc/audit_tools"

cp ~/.ssl/cadcproxy.pem .

mkdir -p ./collectionAuditing

sudo docker run --rm -ti --user $(id -u):$(id -g) -e HOME=/app -v ${PWD}:/app ${IMAGE}  python /usr/local/bin/caomArtifactDiff.py ${@}
