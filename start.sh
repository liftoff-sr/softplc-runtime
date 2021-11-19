#!/bin/bash

./softplc &

discovery docker-container eth0

# we use tini to occupy PID 1, so flush this bash executable when launching sshd with exec
exec /usr/sbin/sshd -D
