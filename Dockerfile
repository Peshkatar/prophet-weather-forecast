FROM continuumio/miniconda3

# copy environment-file
COPY . .

# update conda
#RUN conda update -y conda

# create local virtual environment
# https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
#RUN conda create -p ./venv
RUN conda create -p ./venv pandas prophet seaborn jupyterlab

# update environment from environment.yml
#RUN conda env update -p ./venv --file environment.yml  --prune

# activate environment
# ENV PATH /opt/conda/envs/data-science-test/bin:$PATH
# ENV PATH /opt/miniconda3/envs/data-science-test/bin:$PATH
#RUN /bin/bash -c "conda activate ./venv
RUN conda activate ./venv

# open port 5000
EXPOSE 5000

ENTRYPOINT ["jupyter", "lab", "--notebook-dir=/home", "--ip=0.0.0.0", "--port=5000", "--allow-root"]
