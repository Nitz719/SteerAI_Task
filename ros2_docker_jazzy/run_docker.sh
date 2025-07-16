#!/bin/bash
set -e

IMAGE_NAME="ros2-jazzy-dev"
CONTAINER_NAME="ros2_jazzy_container"

# Run the Docker container with volume and interactive shell
echo "Running container: $CONTAINER_NAME"
docker run -it --rm \
    --name $CONTAINER_NAME \
    --net=host \
    --privileged \
    -v $(pwd)/ros2_ws:/ros2_ws \
    $IMAGE_NAME
