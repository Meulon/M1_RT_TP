docker build -t webserver webServer/
docker run -d --name webserver -p 80:80 webserver

# how to join docker to network
# ovs-docker add-port br eth0 alpine1 --ipaddress=192.168.1.10/24 --gateway=192.168.1.1
# ovs-vsctl list-ports br