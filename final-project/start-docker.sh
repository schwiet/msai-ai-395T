#!/bin/bash

# Set the working directory inside the container
CONTAINER_WORKDIR="/data"

# Get the current user and group IDs
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# Run the Docker container
docker run -it --rm \
    --user=${USER_ID}:${GROUP_ID} \
    -v "$(pwd)":${CONTAINER_WORKDIR} \
    -w ${CONTAINER_WORKDIR} \
    ai395t:latest

