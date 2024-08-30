# msai-ai-395T
Jupyter Notebooks and other files for Case Studies in Machine Learning course

## Start Docker Container

Run the script:

```
./start-docker.sh
```

### Start Jupyter Server

From inside the container, run:

```
jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
```