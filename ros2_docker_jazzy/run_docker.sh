#!/bin/bash
set -e

IMAGE_NAME="ros2-jazzy-dev"
CONTAINER_NAME="ros2_jazzy_container"

echo "Launching TurtleBot 4 simulation in container: $CONTAINER_NAME"

# Enable X11 access for Docker
xhost +local:docker

# Run the Docker container with volume and interactive shell
echo "Running container: $CONTAINER_NAME"
docker run -it --rm \
    --name $CONTAINER_NAME \
    --net=host \
    --privileged \
    -e DISPLAY="$DISPLAY" \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $(pwd)/ros2_ws:/ros2_ws \
    $IMAGE_NAME
