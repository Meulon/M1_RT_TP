#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update
sudo apt-get install -y docker-ce python3-pip lxc mosquitto qemu qemu-utils qemu-system-x86 openvswitch-common openvswitch-switch 
pip install paho-mqtt

cp ovs-ifup /etc/
cp ovs-ifdown /etc/

chmod +x /etc/ovs-if{up,down}

ovs-vsctl add-br br
ip addr add 192.168.1.1/28 dev br
ip link set dev br up
ip link set dev ovs-system up