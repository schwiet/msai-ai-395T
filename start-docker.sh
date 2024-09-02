#!/bin/bash

# Set the notebook directory inside the container
NOTEBOOK_DIR="/opt/notebooks/"

# Run the Docker container
docker run --rm \
    -p 8888:8888 \
    -v "$(pwd)/notebooks":${NOTEBOOK_DIR} \
    jupyter-local:latest

