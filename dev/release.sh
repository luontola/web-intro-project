#!/bin/bash
set -eu
#: ${1:? Usage: $0 RELEASE_VERSION}
DEFAULT_TAG=`date +%Y-%m-%d`
TAG="${1:-$DEFAULT_TAG}"
echo TAG=$TAG
set -x

./build.sh

docker tag "luontola/web-intro" "luontola/web-intro:$TAG"

docker push "luontola/web-intro:$TAG"
docker push "luontola/web-intro:latest"
