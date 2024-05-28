#!/bin/bash

# This script is the entrypoint for the container as started by docker compose.
# The LD_LIBRARY_PATH environment variable is already set by now.

if [[ -z "${LD_LIBRARY_PATH}" ]]; then
	echo "LD_LIBRARY_PATH environment variable not set."
	echo "This should have been done in Dockerfile."
	exit 1
fi


discovery docker-container eth0

/usr/sbin/sshd -D -e  &

exec ./softplc
