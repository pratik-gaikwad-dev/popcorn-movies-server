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

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker push pratikgaikwad/$IMAGE