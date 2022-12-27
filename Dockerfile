FROM continuumio/miniconda3

WORKDIR /assignment-3

# open port 8888
EXPOSE 8888

# copy all local files
COPY . .

# create local virtual environment
# https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
#RUN conda create -p ./venv
RUN conda create -p ./venv pandas prophet seaborn jupyterlab

# update environment from environment.yml
#RUN conda env update -p ./venv --file environment.yml  --prune

# activate environment
#SHELL ["conda", "run", "-n", "./venv", "/bin/bash", "-c"]
SHELL ["conda", "activate", "./venv", "/bin/bash", "-c"]
#SHELL ["jupyter", "lab", "--notebook-dir=/assignment3", "--ip=0.0.0.0", "--port=5000", "--allow-root", "/bin/bash", "-c"]

ENTRYPOINT ["jupyter", "lab", "--notebook-dir=/assignment3", "--ip=0.0.0.0", "--port=5000", "--allow-root"]
