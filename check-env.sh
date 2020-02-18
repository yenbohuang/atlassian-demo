#!/bin/sh

echo
echo "################ ps ##############"
echo
docker ps -a

echo
echo "################ image ##############"
echo
docker image ls

echo
echo "################ volume ##############"
echo
docker volume ls

echo
echo "################ network ##############"
echo
docker network ls

echo
echo "################ network: devops-demo_devops-demo-net ##############"
echo
docker network inspect devops-demo_devops-demo-net

echo
echo "################ top ##############"
echo
docker-compose --compatibility top
