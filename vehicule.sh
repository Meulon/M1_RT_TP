#!/bin/bash

lxc-create -n vehicule -f vehicule/config -t download -- -d alpine -r 3.15 -a amd64

ovs-vsctl add-port br-v br-clone

lxc-attach -n vehicule
adduser driver

apk add python3
python3 -m ensurepip
pip3 install --no-cache --upgrade pip setuptools
pip install paho-mqtt