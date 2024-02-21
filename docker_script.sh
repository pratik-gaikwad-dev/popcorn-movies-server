#!/bin/bash

IMAGE=$IMAGE_NAME

echo "****************************************************************"
echo "Removing the existing docker container for the popcorn-data-server"
echo "****************************************************************"
docker rm -f $IMAGE

echo "****************************************************************"
echo "Removing the existing docker image for the popcorn-data-server"
echo "****************************************************************"
docker rmi -f $IMAGE

echo "****************************************************************"
echo "Building the docker image for the popcorn-data-server"
echo "****************************************************************"
docker build -t $IMAGE .

echo "****************************************************************"
echo "PUSHING IMAGE TO DOCKERHUB"
echo "****************************************************************"
docker tag $IMAGE:latest pratikgaikwad/$IMAGE:latest
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker push pratikgaikwad/$IMAGE

echo "****************************************************************"
echo "Restarting docker compose"
echo "****************************************************************"
cd /var/jenkins_home/popcorn

docker compose down
docker rmi $IMAGE
docker compose pull
docker compose up --force-recreate --build -d
docker image prune -f
