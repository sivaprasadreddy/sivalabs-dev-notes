
Start a container in interactive attached mode:

> docker run -i -t ubuntu:16.04 /bin/bash

Detach from a container

> Ctrl + P Ctrl + Q

Start a container in detached mode:

> docker run -d ubuntu:16.04 /bin/bash

View logs of a container
>docker logs ContainerId

Start/Stop/Pause/Restart a container

> docker start ContainerID
> docker stop ContainerID
> docker restart ContainerID
> docker pause ContainerID
> docker unpause ContainerID

List running containers

> docker ps

List all containers
> docker ps -a

List only container ids
> docker ps -aq

List container ids not running
>docker ps -aq -f status=exited

Delete a container
> docker rm containerId

Delete all stopped containers
> docker rm $(docker ps -aq status=exited)
> docker container prune

Automatically remove container once stopped
> docker run -i -t --rm ubuntu:16.04 /bin/bash

Commit changes in a docker container
> docker commit ContainerID username/repository

Build an image using Dockerfile
> docker build -t busyboxplus:1.0 .

Build an image using different Dockerfile name
> docker build -t busyboxplus:1.0 -f ./myfolder/MyDockerFile


FROM <image>[:<tag>|@<digest>]
MAINTAINER Dr. Peter <peterindia@gmail.com>
COPY <src> ... <dst>
    COPY html /var/www/html
    COPY httpd.conf magic /etc/httpd/conf/

ADD <src> ... <dst>
    ADD web-page-config.tar /
ENV <key> <value>
    ENV DEBUG_LVL 3
    ENV APACHE_LOG_DIR /var/log/apache
WORKDIR <dirpath>
    WORKDIR /var/log
EXPOSE <port>[/<proto>] [<port>[/<proto>]...]
LABEL <key-1>=<val-1> <key-2>=<val-2> ... <key-n>=<val-n>
    LABEL version="2.0" release-date="2016-08-05"

RUN command executes during build time.
RUN <command>
RUN ["<exec>", "<arg-1>", ..., "<arg-n>"]
    RUN echo "echo Welcome to Docker!" >> /root/.bashrc
    RUN ["bash", "-c", "rm", "-rf", "/tmp/abc"]


CMD runs when container starts. only the last CMD instruction will be effective.
CMD <command>
CMD ["<exec>", "<arg-1>", ..., "<arg-n>"]
CMD ["<arg-1>", ..., "<arg-n>"]

########################################################
   # Dockerfile to demonstrate the behavior of CMD
   ########################################################
   # Build from base image busybox:latest
   FROM busybox:latest
   # Author: Dr. Peter
   MAINTAINER Dr. Peter <peterindia@gmail.com>
   # Set command for CMD
   CMD ["echo", "Dockerfile CMD demo"]

docker build -t cmd-demo .
$ sudo docker run cmd-demo
Dockerfile CMD demo

$ sudo docker run cmd-demo echo Override CMD demo
Override CMD demo

only the last ENTRYPOINT instruction will be effective.
ENTRYPOINT <command>
ENTRYPOINT ["<exec>", "<arg-1>", ..., "<arg-n>"]

########################################################
   # Dockerfile to demonstrate the behavior of ENTRYPOINT
   ########################################################
   # Build from base image busybox:latest
   FROM busybox:latest
   # Author: Dr. Peter
   MAINTAINER Dr. Peter <peterindia@gmail.com>
   # Set entrypoint command
   ENTRYPOINT ["echo", "Dockerfile ENTRYPOINT demo"]

$ sudo docker build -t entrypoint-demo .
$ sudo docker run entrypoint-demo
   Dockerfile ENTRYPOINT demo
$ sudo docker run entrypoint-demo with additional arguments
   Dockerfile ENTRYPOINT demo with additional arguments

$ sudo docker run -it --entrypoint="/bin/sh" entrypoint-demo 
/#         

only the last HEALTHCHECK instruction will take effect.
HEALTHCHECK [<options>] CMD <command>
HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1

view layers of a container
docker history ContainerId

 $ sudo docker login
 Username: vinoddandy
 Password:

$ sudo docker images -a
$ sudo docker push vinoddandy/imageforhub2
$ sudo docker rmi vinoddandy/imageforhub2
