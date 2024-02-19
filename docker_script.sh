echo "****************************************************************"
echo "Building the docker image for the popcorn-data-server"
echo "****************************************************************"
docker build -t popcorn-data-server .

echo "****************************************************************"
echo "Running the docker container for the popcorn-data-server"
echo "****************************************************************"
docker run -d -p 8000:8000 --name popcorn-data-server popcorn-data-server

echo "****************************************************************"
echo "Docker container for the popcorn-data-server is running"
echo "****************************************************************"