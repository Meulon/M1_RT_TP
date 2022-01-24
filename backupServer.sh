#!/bin/bash

docker build -t backupserver backupServer/

docker run --detach --name backupserver --env MARIADB_USER=example-user --env MARIADB_PASSWORD=my_cool_secret --env MARIADB_ROOT_PASSWORD=my-secret-pw backupserver

sudo ovs-docker add-port br eth1 backupserver --ipaddress=192.168.1.6/24 --gateway=192.168.1.1