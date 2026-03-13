#!/bin/bash

IMAGE="opencadc/artifact-diff:3.13-slim"

cp ~/.ssl/cadcproxy.pem .

sudo docker run --rm -ti --user $(id -u):$(id -g) -e HOME=/app -v ${PWD}:/app ${IMAGE} /bin/bash -c "/app/collectionAuditingSummary.sh /app/collectionAuditing/artifactDiff_reports/"
