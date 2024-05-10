#!/bin/bash

# Create some basic host directories needed to manage the runtime services
# identified in compose.yml.  Run this once before trying to run
# "docker compose up -d"

# In lieu of running this script, a person could get all these directories
# by simply installing the linux version of Topdoc NexGen.


#rm -rf ${APP_DIR}

source settings.txt

if [[ ! -e ${APP_DIR} ]]; then

	mkdir -p ${APP_DIR}/DEFAULT
	mkdir -p ${CFG_1ST_DIR}
	mkdir -p ${CFG_2ND_DIR}

	# create a temporary non-running container in order to use docker cp:
	# https://stackoverflow.com/questions/25292198/docker-how-can-i-copy-a-file-from-an-image-to-a-host
	id=$(docker create softplc/runtime)
	docker cp $id:/SoftPLC/app/DEFAULT/SOFTPLC.APP ${APP_DIR}/DEFAULT/
	docker cp $id:/SoftPLC/cfg/. ${CFG_1ST_DIR}/
	docker cp $id:/SoftPLC/cfg/. ${CFG_2ND_DIR}/
	docker rm -v $id
fi
