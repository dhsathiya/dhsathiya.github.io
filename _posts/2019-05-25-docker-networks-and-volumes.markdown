---
layout: post
title: "Docker Networks and Volumes"
date: 2019-05-25
categories: docker
tags: docker network volume
---
> Let’s get started with Volumes and Networks in Docker. If you are just starting with docker then I will suggest you to check my [Docker for kids][Docker for kids] post.

## Docker Networks
Docker networks are same as the network we have at our home. A WiFi router and multiple devices connected with it.

In case of Docker there will be Containers as devices.


---<br />
# Let’s get started
First we have to *create a network*
```bash
$ docker network create testnet
# testnet -> name of the network
-----
# to list the networks.
# you will see your network that you created here.
$ docker network ls
```
Now our network is created let’s *attach* containers(simply devices) to it.
```bash
# two container which will automatically remove when you exit.
# Use 3 terminal windows.
# 1 for ubuntu1, 1 for ubuntu2 and 1 for other commands
-----
$ docker run --rm -it --name=ubuntu1 --net=testnet ubuntu
$ docker run --rm -it --name=ubuntu2 --net=testnet ubuntu

# --name -> name of the container
# --net -> name of the network in which these two container will attach.
```
Now a note : Docker containers in the same network can communicate with each other by container name also.

---<br />
Now let’s *inspect* our network to see the details about the containers that we just attached in it.
```
$ docker network inspect testnet
# Output (Snippet)
"Containers": {
            "4546fe405f6755cdce83c04c666710a7e0b899d688247bfae967ad973f433f58": {
                "Name": "ubuntu1",
                "EndpointID": "37c8edda8657cf486786884390ed520eee662d6461c8eeb7397b5c8b60920c19",
                "MacAddress": "02:42:ac:15:00:02",
                "IPv4Address": "172.21.0.2/16",
                "IPv6Address": ""
            },
            "e2ec3e500f29c96224a4a317170b22bf1d064f62c00fdd619e20a0d7c35d0c6a": {
                "Name": "ubuntu2",
                "EndpointID": "9dae07afdc3ca8a954843a557893d0edd426f92651bc4c553f4cc36949f843d7",
                "MacAddress": "02:42:ac:15:00:03",
                "IPv4Address": "172.21.0.3/16",
                "IPv6Address": ""
            }
        },
```
You will see out two containers attached in the network and their respective IP address as well.

---<br />
The next task will be to ping ubuntu1 container from ubuntu2 container.

Go to the terminal of ubuntu2 and run these commands
```bash
$ apt update && apt install iputils-ping -y
$ ping ubuntu1
# Output will be something like
# 64 bytes from bom05s09-in-f14.1e100.net (172.217.26.238): icmp_seq=4 ttl=55 time=40.1 ms
```
---<br />
# Port | Nginx example
Suppose you have Nginx running in a container and you want to use it. Nginx listens to port 80 by default. So we have to *expose* the container’s port to the host machine’s port.
```bash
$ docker run --rm -it --name=ubuntu1 -p 80:8080 ubuntu
# -p -> port
# 80: -> container port
# :8080 -> host port
```
Great now your system is connected to the container at port 8080. Every request to that port will go to the Container ‘s port 80.

Let’s *install Nginx* in that container. Run this command inside the container.
```bash
$ apt update && apt install nginx -y && nginx
```
Our Nginx service is running now. To reverse check run this command to see if Nginx has started or not.
```bash
$ service nginx status
# Output will be something like 'service nginx is running'
Now go to your browser and type localhost:8080 in address bar.
```
Nginx page will be displayed !

---<br />
## Docker Volume
There are *volumes* which are persisting data generated by and used by Docker containers and *Bind mounts* on the other hand are directory on your system shared with the docker container.

# Volume
Create a volume.
```bash
# create a volume named testvol.
$ docker volume create testvol
```
---<br />

*Attach* this volume to our containers at root as directory named mydir.
```bash
$ docker run --rm -it -v testvol:/mydir --name=ubuntu1 ubuntu
$ docker run --rm -it -v testvol:/mydir --name=ubuntu2 ubuntu
# -v -> volume
# testvol: -> name of the volume that you created
# :/mydir -> path to attach that volume in the docker container
```
Now whatever you do inside mydir directory that will be *shared* between both of the containers

---<br />
# Bind Mount
*Attach a directory* from your system inside a docker container by using this command
```bash
$ docker run --rm -it -v /home/username:/hello --name=ubuntu1 ubuntu
-----
# Syntax 
docker run -it -v <host_directory_path>:<container_path> imagename
```
---<br />

# Further reading:
Docker Networking : [https://docs.docker.com/network/][network]

Docker Volumes : [https://docs.docker.com/storage/volumes/][volumes]

Docker Bind mounts : [https://docs.docker.com/storage/bind-mounts/][bind-mounts]

> Now you have all the things to make things with docker ! You can make a LAMP stack or A npm container to compile your project files !

[Docker for kids]: {{ site.baseurl }}{% link _posts/2019-05-24-docker-for-kids.markdown %}
[network]: https://docs.docker.com/network/
[volumes]: https://docs.docker.com/storage/volumes/
[bind-mounts]: https://docs.docker.com/storage/bind-mounts/
