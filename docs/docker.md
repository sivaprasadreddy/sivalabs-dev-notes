# Docker Commands

## Docker basics

Start a container in interactive attached mode: `docker run -i -t ubuntu:16.04 /bin/bash`

Detach from a container: `Ctrl + P Ctrl + Q`

Start a container in detached mode: `docker run -d ubuntu:16.04 /bin/bash`

View logs of a container: `docker logs ContainerId`

Start/Stop/Pause/Restart a container:

* `docker start ContainerID`
* `docker stop ContainerID`
* `docker restart ContainerID`
* `docker pause ContainerID`
* `docker unpause ContainerID`

List running containers: `docker ps`

List all containers: `docker ps -a`

List only container ids: `docker ps -aq`

List container ids not running: `docker ps -aq -f status=exited`

Delete a container: `docker rm containerId`

Delete all stopped containers:

* `docker rm $(docker ps -aq status=exited)`
* `docker container prune`

Automatically remove container once stopped: `docker run -i -t --rm ubuntu:16.04 /bin/bash`

Commit changes in a docker container: `docker commit ContainerID username/repository`

## Create Docker Image

Build an image using Dockerfile: `docker build -t sivaprasadreddy/myapp:1.0 .`

Build an image using different Dockerfile name: 

`docker build -t busyboxplus:1.0 -f ./myfolder/MyDockerFile`

View layers of a container: `docker history ContainerId`

**Sample Dockerfile**

```
# A basic apache server. To use either add or bind mount content under /var/www
FROM ubuntu:12.04

LABEL maintainer="siva@mail.com"

RUN apt-get update && apt-get install -y apache2 && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
```

## Docker Instructions

**FROM** : The FROM instruction initializes a new build stage and sets the Base Image for subsequent instructions.

`FROM <image>[:<tag>|@<digest>]`

`FROM ubuntu:latest`

**COPY**: The COPY instruction copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`.

`COPY <src> ... <dst>`

`COPY html /var/www/html`

`COPY httpd.conf magic /etc/httpd/conf/`

**ADD**: The ADD instruction copies new files, directories or remote file URLs from `<src>` and adds them to the filesystem of the image at the path `<dest>`.

`ADD <src> ... <dst>`

`ADD web-page-config.tar /`

**ENV**: The ENV instruction sets the environment variable `<key>` to the value `<value>`.

`ENV <key> <value>`

`ENV DEBUG_LVL 3`

`ENV APACHE_LOG_DIR /var/log/apache`

**WORKDIR** : The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.

`WORKDIR <dirpath>`

`WORKDIR /var/log`

**EXPOSE**: The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.

`EXPOSE <port>[/<proto>] [<port>[/<proto>]...]`

`EXPOSE 8080 8787`

**LABEL**: The LABEL instruction adds metadata to an image. A LABEL is a key-value pair.

`LABEL <key-1>=<val-1> <key-2>=<val-2> ... <key-n>=<val-n>`

`LABEL version="2.0" release-date="2016-08-05"`

**RUN** The `RUN` command executes during build time.

`RUN <command>` (or) `RUN ["<exec>", "<arg-1>", ..., "<arg-n>"]`

* `RUN echo "echo Welcome to Docker!" >> /root/.bashrc`
* `RUN ["bash", "-c", "rm", "-rf", "/tmp/abc"]`

**CMD**: The CMD is to provide defaults for an executing container and runs when container starts. There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.

`CMD <command>` (or) `CMD ["<exec>", "<arg-1>", ..., "<arg-n>"]` (or) `CMD ["<arg-1>", ..., "<arg-n>"]`

//Dockerfile to demonstrate the behavior of CMD
```
FROM busybox:latest
MAINTAINER Siva <sivaprasadreddy.k@gmail.com>
CMD ["echo", "Dockerfile CMD demo"]
```

`> docker build -t cmd-demo .`

`> sudo docker run cmd-demo`

**Output** : Dockerfile CMD demo

`> sudo docker run cmd-demo echo Override CMD demo`

**Output** : Override CMD demo

**ENTRYPOINT**: An ENTRYPOINT allows you to configure a container that will run as an executable.

`ENTRYPOINT <command>` (or) `ENTRYPOINT ["<exec>", "<arg-1>", ..., "<arg-n>"]`

Only the last ENTRYPOINT instruction will be effective.

//Dockerfile to demonstrate the behavior of ENTRYPOINT
```
FROM busybox:latest
ENTRYPOINT ["echo", "Dockerfile ENTRYPOINT demo"]
```

`> sudo docker build -t entrypoint-demo .`

`> sudo docker run entrypoint-demo`

**Output** : Dockerfile ENTRYPOINT demo

`> sudo docker run entrypoint-demo with additional arguments`

**Output** : Dockerfile ENTRYPOINT demo with additional arguments

`> sudo docker run -it --entrypoint="/bin/sh" entrypoint-demo`

**Output** : /#

**HEALTHCHECK**: The `HEALTHCHECK` instruction tells Docker how to test a container to check that it is still working.

`HEALTHCHECK [<options>] CMD <command>`

Only the last HEALTHCHECK instruction will take effect.

`HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1`

**Push image to DockerHub**

`$ docker images -a`

`$ docker login`

Username: sivaprasadreddy

Password: my_password

* `docker push sivaprasadreddy/myapp`

Delete Image

* `docker rmi sivaprasadreddy/myapp`

## Docker cleanup

Delete volumes

* `docker volume rm $(docker volume ls -qf dangling=true)`
* `docker volume ls -qf dangling=true | xargs -r docker volume rm`

Delete networks

* `docker network ls`
* `docker network ls | grep "bridge"`
* `docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')`
* `docker network prune`

Remove docker images

* `docker images`
* `docker rmi $(docker images -q)` //delete all images
* `docker rmi $(docker images --filter "dangling=true" -q --no-trunc)`
* `docker images | grep "none"`
* `docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')`

Remove docker containers

* `docker ps -a`
* `docker kill $(docker ps -q)`
* `docker rm $(docker ps -qa --no-trunc --filter "status=exited")`

Docker System Prune

```
$ docker system prune -a

WARNING! This will remove:
	- all stopped containers
	- all volumes not used by at least one container
	- all networks not used by at least one container
	- all images without at least one container associated to them
Are you sure you want to continue? [y/N] y
```

Resize disk space for docker vm

* `docker-machine create --driver virtualbox --virtualbox-disk-size "40000" default`