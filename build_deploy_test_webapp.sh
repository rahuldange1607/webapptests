#!/bin/bash

BUILD_NUMBER=$1

echo "Building docker image for webapp"
docker build -t rahuldange1607/webapp:${BUILD_NUMBER} .

echo "Deploying webapp docker container"
docker run -d -p 80:80 --name webapp rahuldange1607/webapp:${BUILD_NUMBER}

echo "Building selenium tests for webapp"
mvn clean package

echo "Testing webapp"
java -jar target/webapptests-0.0.1-SNAPSHOT-jar-with-dependencies.jar

echo "Stopping webapp docker container"
docker container stop webapp
docker container rm $(docker container ls -aq)