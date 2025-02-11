#!/bin/bash
# Login to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 668225365479.dkr.ecr.us-east-1.amazonaws.com

# Pull the latest image
docker pull 668225365479.dkr.ecr.us-east-1.amazonaws.com/abd-ecr:v2

# Check if the container 'campusx-app' is running
if [ "$(docker ps -q -f name=campusx-app)" ]; then
    # Stop the running container
    docker stop campusx-app
fi

# Check if the container 'campusx-app' exists (stopped or running)
if [ "$(docker ps -aq -f name=campusx-app)" ]; then
    # Remove the container if it exists
    docker rm campusx-app
fi

# Run a new container
docker run -d -p 80:5000 -e DAGSHUB_PAT=6029a7e23424fe7f966d281884fab66d92324483 --name campusx-app 668225365479.dkr.ecr.us-east-1.amazonaws.com/abd-ecr:v3