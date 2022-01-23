#!/bin/bash

sudo lxc-create -n vehicule -f vehicule/config -t download -- -d alpine -r 3.15 -a amd64
sudo lxc-start -n vehicule -f vehicule/config
sudo ovs-vsctl add-port br-v br-clone

lxc-attach -n vehicule
adduser driver
apk add python3 openssh
python3 -m ensurepip
pip3 install --no-cache --upgrade pip setuptools
pip3 install paho-mqtt