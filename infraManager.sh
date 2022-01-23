#!/bin/bash

wget -O gi.img "https://urca.s3.fr-par.scw.cloud/gi.img?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=SCWTK3ZDZ3RGJ5TRZS2X%2F20220123%2Ffr-par%2Fs3%2Faws4_request&X-Amz-Date=20220123T145326Z&X-Amz-Expires=521996&X-Amz-Signature=b961caf24b6e8bddfdabff7ea845c256196e650b73e8a59a87f70cd4fe53d218&X-Amz-SignedHeaders=host"

sudo qemu-system-x86_64 -k fr -m 512 \
-drive file=./gi.img,format=qcow2 \
-boot d \
-device e1000,netdev=net0 \
-netdev tap,id=net0,script=/etc/ovs-ifup,downscript=/etc/ovs-ifdown \
-display none &