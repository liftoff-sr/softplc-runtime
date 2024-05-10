#!/bin/bash

# This script is the entrypoint for the container as started by docker compose.
# The LD_LIBRARY_PATH environment variable is already set by now.

if [[ -z "${LD_LIBRARY_PATH}" ]]; then
	echo "LD_LIBRARY_PATH environment variable not set."
	echo "This should have been done in Dockerfile."
	exit 1
fi


./softplc &

discovery docker-container eth0

# we use compose.yml "init: true" (tini) to occupy PID 1, so flush this bash
# executable when launching sshd with exec
exec /usr/sbin/sshd -D
