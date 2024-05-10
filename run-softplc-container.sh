# A script which operates at a lower level than "docker compose".  This is
# not used any more since docker compose is the way to go.

MACHINE_NAME=splc-container

# configure these exposed ports for the softplc-runtime container, then be
# sure and match them in the Topdoc NexGen configuration for this virtual PLC.
PORT_SSH=55666
PORT_REMOTE_EDIT=55667
PORT_REMOTE_UPLOAD=55668

docker run --init \
	-d \
	--rm \
	--name $MACHINE_NAME \
	--hostname $MACHINE_NAME \
	-p $PORT_SSH:22 \
	-p $PORT_REMOTE_EDIT:2222 \
	-p $PORT_REMOTE_UPLOAD:2223 \
	-p 2223:2223/udp \
	--cap-add SYS_NICE \
	--cap-add SYS_RESOURCE \
	softplc/runtime


