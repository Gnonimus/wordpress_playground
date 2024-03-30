#!/bin/bash

IMAGE_NAME="wordpress_playground"

echo "Building the image ${IMAGE_NAME}"

if [ -n "$(docker images -q $IMAGE_NAME 2>/dev/null)" ]; then
    if [ -n "$(docker ps -a --filter ancestor="$IMAGE_NAME" -q 2>/dev/null)" ]; then
      echo "There are containers running based on the image. Stop containers before deleting and rebuilding the image."
    else
        if docker rmi $IMAGE_NAME &>/dev/null; then
            echo "The image $IMAGE_NAME has been removed."
        fi
        if docker build --no-cache -t $IMAGE_NAME . &>/dev/null; then
            echo "The image $IMAGE_NAME has been re-created."
        fi
    fi
else
    echo "The image $IMAGE_NAME doesn't exists."
    if docker build --no-cache -t $IMAGE_NAME . &>/dev/null; then
        echo "The image $IMAGE_NAME has been created."
    fi
fi
