#!/bin/bash

IMAGE="opencadc/artifact-diff:3.13-slim"

cp ~/.ssl/cadcproxy.pem .

mkdir -p ./collectionAuditing

docker run --rm -ti --user $(id -u):$(id -g) -e HOME=/app -v ${PWD}:/app ${IMAGE}  python /usr/local/bin/caomArtifactDiff.py ${@}
