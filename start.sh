#!/bin/bash

echo "CWD:"`pwd` > /tmp/log
echo "LD_LIBRARY_PATH:$LD_LIBRARY_PATH" >> /tmp/log


./softplc &

discovery docker-container eth0

/usr/sbin/sshd -D &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?

