#!/bin/bash

docker pull eclipse-mosquitto
docker run -d --name eventmanager -p 1884:1883 -p 9002:9001 --net=host eclipse-mosquitto
sudo ovs-docker add-port br eth1 eventmanager --ipaddress=192.168.1.2/24 --gateway=192.168.1.1

# join docker to network
# ovs-docker add-port br eth1 eventmanager --ipaddress=192.168.1.2/24 --gateway=192.168.1.1
# test
# mosquitto_sub -t house/# -h localhost
# mosquitto_pub -h localhost -m "test message" -t house/bulb4