#!/bin/bash

docker build -t buffer buffer/
docker run -d --name buffer -p 5672:5672 buffer
sudo ovs-docker add-port br eth1 buffer --ipaddress=192.168.1.4/24 --gateway=192.168.1.1