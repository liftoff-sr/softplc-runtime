#!/bin/bash -e

# Build the SoftPLC Runtime docker image for Debian Bullseye.  Upon completion
# an image with name $IMAGE (="softplc/runtime") will exist on this local machine
# and can be used locally.  SoftPLC Corp has this image for the time being
# at docker hub.

VERSION_TAG=":1.1"

IMAGE="softplc/runtime"

NOCACHE='--no-cache --pull'

docker build $NOCACHE -t $IMAGE$VERSION_TAG -t $IMAGE:latest .

#docker push -a $IMAGE
