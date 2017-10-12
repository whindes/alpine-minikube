#!/bin/sh

#clean pid after unexpected kill
if [ -f "/var/run/docker.pid" ]; then
		rm -rf /var/run/docker.pid
fi

# Add docker daemon as command if needed
if [[ "$1" != 'dockerd-cmd.sh' ]]; then
	echo "Starting Docker Daemon"
	docker daemon \
			--host=unix:///var/run/docker.sock \
			--host=tcp://0.0.0.0:2375  \
			--storage-driver=vfs &
fi

# set docker settings
echo "export DOCKER_HOST='tcp://127.0.0.1:2375'" >> /etc/profile
# reread all config
source /etc/profile

exec "$@"