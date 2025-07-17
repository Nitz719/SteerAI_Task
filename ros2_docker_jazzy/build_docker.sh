#!/bin/bash
set -e

IMAGE_NAME="ros2-jazzy-turtlebot4"
TAG="latest"

echo "Building Docker image: ${IMAGE_NAME}:${TAG}"
docker build -t "${IMAGE_NAME}:${TAG}" .
