#!/bin/bash
sudo apt-get update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install -y docker-ce mosquitto python3-paho-mqtt lxc qemu qemu-utils qemu-system-x86 openvswitch-common openvswitch-switch


chmod +x /etc/ovs-if{up,down}

ovs-vsctl add-br br
ip addr add 192.168.1.1/28 dev br
ip link set dev br up
ip link set dev ovs-system up

sudo qemu-system-x86_64 -k fr -m 512 \
-drive file=./gi.img,format=qcow2 \
 -boot d \
 -device e1000,netdev=net0 \
 -netdev tap,id=net0,script=/etc/ovs-ifup,downscript=/etc/ovs-ifdown \
 -display vnc=:0 &

 ovs-docker add-port br eth0 alpine1 --ipaddress=192.168.1.10/24 --gateway=192.168.1.1
 ovs-vsctl list-ports br