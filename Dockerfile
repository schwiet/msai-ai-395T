# Use the latest Miniconda image
FROM continuumio/miniconda3:latest

# Set environment variables to avoid interactive prompts during installations
ENV DEBIAN_FRONTEND=noninteractive

# Update the system and install some basic utilities
RUN apt-get update --yes && \
    apt-get upgrade --yes && \
    apt-get install --yes build-essential && \
    apt-get clean

# Create a new conda environment with the most common machine learning packages
RUN conda create --yes --name ml_env python=3.9 && \
    conda install --yes -n ml_env \
        jupyterlab \
        numpy \
        pandas \
        scikit-learn \
        matplotlib \
        seaborn \
        scipy \
        tensorflow \
        keras \
        pytorch \
        xgboost && \
    conda clean --all --yes

# Activate the environment and ensure it’s used in Jupyter notebooks
RUN echo "source activate ml_env" > ~/.bashrc
ENV PATH /opt/conda/envs/ml_env/bin:$PATH

# Expose the port for JupyterLab
EXPOSE 8888

# Command to start JupyterLab
CMD ["jupyter", "lab", "--notebook-dir=/opt/notebooks", "--ip=*", "--port=8888", "--no-browser", "--allow-root"]
