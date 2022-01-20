#!/bin/bash

docker pull eclipse-mosquitto
docker run -d --name eventmanager -p 1883:1883 -p 9001:9001 --net=host eclipse-mosquitto

# test
# mosquitto_sub -t house/# -h localhost
# mosquitto_pub -h localhost -m "test message" -t house/bulb4