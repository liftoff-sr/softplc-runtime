MACHINE_NAME=splc-container

# configure these exposed ports for the softplc-runtime container
PORT_SSH=55666
PORT_REMOTE_EDIT=55667
PORT_REMOTE_UPLOAD=55668

docker run -d \
	--rm \
	--name $MACHINE_NAME \
	--hostname $MACHINE_NAME \
	-p $PORT_SSH:22 \
	-p $PORT_REMOTE_EDIT:2222 \
	-p $PORT_REMOTE_UPLOAD:2223 \
	-p 2223:2223/udp \
	--cap-add SYS_NICE \
	--cap-add CAP_SYS_RESOURCE \
	softplc/runtime


