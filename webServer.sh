#!/bin/bash

docker build -t webserver webServer/
docker run -d --name webserver -p 80:80 webserver
sudo ovs-docker add-port br eth1 webserver --ipaddress=192.168.1.5/24 --gateway=192.168.1.1

# how to join docker to network
# sudo ovs-docker add-port br eth1 webserver --ipaddress=192.168.1.5/24 --gateway=192.168.1.1
# sudo ovs-vsctl list-ports br