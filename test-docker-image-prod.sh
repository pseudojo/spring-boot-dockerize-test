#!/bin/sh
cat << \EOF > /tmp/application-prod.properties
server.port=8080

custom.myname=Gildong Hong
custom.myage=49
custom.mytel=01049498989

EOF

docker run -dt --rm --name dockerize-test -p8080:8080 -v /tmp/application-prod.properties:/home/app/application-prod.properties pseudojo/spring-boot-dockerize-test:0.0.1 -Dspring.profiles.active=prod -jar /home/app/app.jar

sleep 5

curl localhost:8080/user

echo "--------------------"
docker stop dockerize-test
