#!/bin/bash

docker build -t buffer buffer/
docker run -d --name buffer -p 5672:5672 buffer