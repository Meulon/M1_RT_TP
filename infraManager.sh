wget -O gi.img "https://urca.s3.fr-par.scw.cloud/gi.img?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=SCWJXP44B4NSST966SNK%2F20220115%2Ffr-par%2Fs3%2Faws4_request&X-Amz-Date=20220115T113250Z&X-Amz-Expires=556055&X-Amz-Signature=4299f610a3d7c616b2852befde40d544cd71651c9b7f888d0f2860c4e25e9824&X-Amz-SignedHeaders=host"

sudo qemu-system-x86_64 -k fr -m 512 \
-drive file=./gi.img,format=qcow2 \
-boot d \
-device e1000,netdev=net0 \
-netdev tap,id=net0,script=/etc/ovs-ifup,downscript=/etc/ovs-ifdown \
-display none &