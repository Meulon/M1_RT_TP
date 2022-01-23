#!/bin/bash

docker build -t webserver webServer/
docker run -d --name webserver -p 80:80 webserver

# how to join docker to network
# ovs-docker add-port br eth1 webserver --ipaddress=192.168.1.5/24 --gateway=192.168.1.1
# ovs-vsctl list-ports br