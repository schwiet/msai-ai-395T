#!/bin/bash

# Set the notebook directory inside the container
NOTEBOOK_DIR="/opt/notebooks/"

# Get the current user and group IDs
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# Run the Docker container
docker run -it --rm \
    -p 8888:8888 \
    -v "$(pwd)/notebooks":${NOTEBOOK_DIR} \
    jupyter-local:latest \
    /bin/bash

