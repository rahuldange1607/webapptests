#!/bin/bash

echo "Building docker image"
docker build -t rahuldange1607/webapp:${BUILD_NUMBER} .

echo "Running docker container"
docker run -d -p 80:80 rahuldange1607/webapp:${BUILD_NUMBER}
