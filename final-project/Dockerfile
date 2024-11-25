# Use an official Ubuntu base image
FROM ubuntu:latest

# Avoid interactive dialogues by setting this environment variable
ENV DEBIAN_FRONTEND=noninteractive

# Install TeX Live and some basic packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-extra \
    texlive-pictures \
    texlive-bibtex-extra \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clean up unnecessary files to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Reset the frontend
ENV DEBIAN_FRONTEND=

# Set the working directory
WORKDIR /data

# Start with a shell
CMD ["/bin/bash"]

