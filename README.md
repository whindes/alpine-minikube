![Docker](https://msopentech.com/wp-content/uploads/docker-logo.png)

# About
Pure alpine linux docker. Docker inside docker.
> [wikipedia.org/wiki/Docker](https://en.wikipedia.org/wiki/Docker_(software))

# Usage

## System Requirements

The ~700Mb image has an already created minkikube instance with 4Gb diskspace and 1Gb RAM.
This is only for experimentation and demo only.  Do not use in production.  The minikube binary from the official
repository does not work in Alpine and had to be built from source.  (See Dockerfile)

## Commandline

Starts a shell ready to docker & minikube
```bash
docker run -ti --privileged whindes/alpine-minikube sh
```

## Minikube

After the commands below navigate to http://<your_host_docker>:30000/#!/overview?namespace=default

```bash
docker run -ti -p 30000 -p 31920 --rm --privileged whindes/alpine-minikube sh
[Hit Enter] to get the shell prompt
minikube start
kubectl run webserver --image=nginx:alpine
kubectl expose deployment webserver --type=LoadBalancer --port=80
```

## Daemon

```bash
docker run --name alpine-docker -p 2375:2375 --privileged -d whindes/alpine-minikube
```

To start a shell in your new container.

```bash
docker exec -ti alpine-docker /bin/sh
```

## Inside the container shell

Now you can start containers inside your alpine-docker container.

```bash
docker run -d elasticsearch
docker images
docker ps -a
docker volume ls
```

## Docker-compose

If you need docker-compose inside your alpine-docker container.
```bash
setup-compose
docker-compose up
```

## Remote docker

Set your client system variables and go
```bash
export DOCKER_API_VERSION=1.23
export DOCKER_HOST='tcp://127.0.0.1:2375'
docker ps
docker-compose up
```
