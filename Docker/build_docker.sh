#!/bin/bash

IMAGE_NAME="alchemy-nginx"

echo "Logging into Docker Hub $DOCKER_USERNAME"
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin


DOCKER_IMAGEREPO=${DOCKER_USERNAME}/${IMAGE_NAME}
echo "Building Docker image: $DOCKER_IMAGEREPO with tag: $DOCKER_TAG"


# Build docker image
docker build -t $DOCKER_IMAGEREPO:$DOCKER_TAG .

# Push docker image to docker hub
docker push $DOCKER_IMAGEREPO:$DOCKER_TAG

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image build was successfull with DOCKER_TAG: $DOCKER_IMAGEREPO:$DOCKER_TAG"
else
    echo "Failed to build Docker image $DOCKER_IMAGEREPO:$DOCKER_TAG"
fi

# Logout from Docker Hub
docker logout