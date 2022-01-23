#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update
sudo apt-get install -y docker-ce python3-pip lxc mosquitto qemu qemu-utils qemu-system-x86 openvswitch-common openvswitch-switch 
pip install paho-mqtt

sudo cp ovs-ifup /etc/
sudo cp ovs-ifdown /etc/

sudo chmod +x /etc/ovs-if{up,down}

sudo ovs-vsctl add-br br
sudo ip addr add 192.168.1.1/28 dev br
sudo ip link set dev br up

sudo ovs-vsctl add-br br-v
sudo ip addr add 10.0.0.1/8 dev br-v
sudo ip link set dev br-v up

sudo ip link set dev ovs-system up