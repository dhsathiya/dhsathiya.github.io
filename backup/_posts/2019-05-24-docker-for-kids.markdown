---
layout: post
title: "Docker for kids"
date: 2019-05-24 
categories: docker
tags: docker tutorial ubuntu
---

>I am playing with Docker since almost a month. Did nothing fancy but I’ll try to explain the Docker in short.

I’ll run a Ubuntu Container as an example and we will see Docker concepts/commands using it.

## What is Docker ?
Documentation is the best way to learn something but sometimes you won’t need the core knowledge and just want to start straight to the tech.

Read this Docker docs page for a head start : [Get Started][Get Started]
You can come back and start from here at when you complete this topic : ‘Container and virtual machines’.

I remember Image as `.ISO` file and a Container as `PC`. Just think that you are formatting your PC.

---<br />
## Ubuntu in Container
# Install Docker
Install Docker : `apt install docker.io` OR if you want the CE (Community Edition) which is developer friendly then follow this instructions : [Docker CE][Docker CE] (Simple as Vanilla).


---<br />
# Before we start
Check out these few commands. We’ll be using these a lot
```bash
# Docker Container list : Displays all the running containers
$ docker container ls
-----
# Docker Container list : running as well as stopped containers
$ docker container ls -a
-----
# Docker Images : List and Display all the images that you already downloaded to your system. Example: Ubuntu, Nginx, Mariadb etc.
$ docker images
```

---<br />
# Let’s start with Ubuntu in a container
Before we run a container we have to *download* a Image which will run inside that container.

To *pull* (simply download) the Ubuntu image we will run
```bash
$ docker pull ubuntu:latest
# pull -> to download the image
# ubuntu -> name of the image
# latest -> version of that image
```
You can check out other images available on : [Docker Hub][Docker Hub]

To *list* the *images* that you already have we will run
```bash
$ docker images
# Output 
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              94e814e2efa8        13 days ago         88.9MB
```
Okay cool. We now have Ubuntu image downloaded.

To start a container with this image we will run
```bash
$ docker run -i -d ubuntu
# run -> to start a container with a specific image
# -i -> to keep STDIN open otherwise the container will exit just after creation.
# -d -> detached mode means the container will run in background. 
$ docker container ls
# Output
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
f2c1e776d797        ubuntu              "/bin/bash"         17 seconds ago      Up 15 seconds                           boring_thompson
Now our Docker container is up and running.
```
To get a *shell access* of the Ubuntu container we will run
```bash
$ docker exec -it <CONTAINER ID> bash
or 
$ docker exec -it <CONTAINER NAME> bash
# In my case it would be 
# $ docker exec -it f2c1e776d797 bash
# exec -> which allows a user to spawn a process inside their Docker container
# -i -> interactive
# -t -> pseudo tty
```
To exit the shell of the container simply type `exit` and press `return/enter` key.

Alternatives of the same commands can be :
```bash
$ docker run -it ubuntu
# You will directly gain access to the shell of the docker container. But when you exit from the shell, container will stop immediately.
-----
$ docker run --rm -it ubuntu
 # This command will create a removable container. That is you will get a shell access but as soon as you exit the container will be stopped and removed. Good for quick testing.
```
Now it’s time to *stop* the container
```bash
$ docker container stop <CONTAINER ID>
#or
$ docker container stop <CONTAINER NAME>
# in my case it would be
# $ docker container stop boring_thompson
```
Want to *restart* your container ? Your files will be as it is !
```bash
$ docker container start <CONTAINER ID>
or
$ docker container start <CONTAINER NAME>
# in my case it would be
# $ docker container start boring_thompson
```
Oops ! what if you messed up with your docker container ?

Simple just *remove* it and start with a new container !
```bash
$ docker container rm <CONTAINER ID>
or
$ docker container rm <CONTAINER NAME>
# in my case it would be
# $ docker container rm boring_thompson
```
Let’s remove Ubuntu image as well
```
$ docker image rm ubuntu
```
> That is probably all the basics of the Docker. I will cover some more detailed topics like Networking and Volumes in a new article.

[Get Started]: https://docs.docker.com/get-started/
[Docker CE]: https://docs.docker.com/install/linux/docker-ce/ubuntu/
[Docker Hub]: https://hub.docker.com/

