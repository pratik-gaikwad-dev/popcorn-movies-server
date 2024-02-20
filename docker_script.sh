echo "****************************************************************"
echo "Removing the existing docker container for the popcorn-data-server"
echo "****************************************************************"
docker rm -f popcorn-data-server

echo "****************************************************************"
echo "Removing the existing docker image for the popcorn-data-server"
echo "****************************************************************"
docker rmi -f popcorn-data-server

echo "****************************************************************"
echo "Building the docker image for the popcorn-data-server"
echo "****************************************************************"
docker build -t popcorn-data-server .

echo "****************************************************************"
echo "Running the docker container for the popcorn-data-server"
echo "****************************************************************"
docker run -d -p 8000:8000 -v popcorn_images:/app/images -v popcorn_videos:/app/videos --network=pratiknetwork --name popcorn-data-server --rm popcorn-data-server

echo "****************************************************************"
echo "Docker container for the popcorn-data-server is running"
echo "****************************************************************"