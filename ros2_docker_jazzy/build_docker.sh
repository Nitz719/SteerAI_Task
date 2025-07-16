#!/bin/bash
set -e

IMAGE_NAME="ros2-jazzy-dev"

echo "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .