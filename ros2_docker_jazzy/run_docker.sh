#!/bin/bash
set -e

IMAGE_NAME="ros2-jazzy-turtlebot4:latest"
CONTAINER_NAME="ros2_jazzy_turtlebot4"

WORKSPACE_DIR="$(pwd)/ros2_ws"
mkdir -p "$WORKSPACE_DIR"

echo "Launching TurtleBot 4 simulation in container: $CONTAINER_NAME"
docker run -it --rm \
  --name "$CONTAINER_NAME" \
  --net=host \
  --privileged \
  -e DISPLAY="$DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "$WORKSPACE_DIR":/ros2_ws \
  -w /ros2_ws \
  "$IMAGE_NAME"
