#!/bin/sh
docker run -dt --rm --name dockerize-test -p8080:8080 pseudojo/spring-boot-dockerize-test:0.0.1

sleep 5

curl localhost:8080/user

echo "--------------------"
docker stop dockerize-test
