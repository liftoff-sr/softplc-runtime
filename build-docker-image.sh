#!/bin/bash -e

# Build the SoftPLC Toolkit Docker Image for Debian Bullseye

#TAG=":1.0"
#TAG=":latest"

IMAGE="softplc/runtime$TAG"

NOCACHE='--no-cache --pull'
#NOCACHE=

docker build $NOCACHE -t $IMAGE .

if [[ 0 -eq 1 ]]; then
	echo "docker push $IMAGE:$TAG"
	docker push $IMAGE:$TAG

	echo "docker tag $IMAGE:$TAG $IMAGE:latest"
	docker tag $IMAGE:$TAG $IMAGE:latest

	echo "docker push $IMAGE:latest"
	docker push $IMAGE:latest
fi
