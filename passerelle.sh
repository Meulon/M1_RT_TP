#!/bin/bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update
sudo apt-get install -y docker-ce python3-pip lxc mosquitto qemu qemu-utils qemu-system-x86 openvswitch-common openvswitch-switch 
pip install paho-mqtt

wget -O gi.img "https://urca.s3.fr-par.scw.cloud/gi.img?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=SCWJXP44B4NSST966SNK%2F20220115%2Ffr-par%2Fs3%2Faws4_request&X-Amz-Date=20220115T113250Z&X-Amz-Expires=556055&X-Amz-Signature=4299f610a3d7c616b2852befde40d544cd71651c9b7f888d0f2860c4e25e9824&X-Amz-SignedHeaders=host"

cp ovs-ifup /etc/
cp ovs-ifdown /etc/

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
-display none &

# ovs-docker add-port br eth0 alpine1 --ipaddress=192.168.1.10/24 --gateway=192.168.1.1
# ovs-vsctl list-ports br

docker build -t webserver webServer/
docker run -d --name webserver -p 80:80 webserver