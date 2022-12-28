FROM continuumio/miniconda3

WORKDIR /assignment-3

# open port 5000
EXPOSE 5000

# copy all local files
COPY . .

# create local virtual environment
# https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
RUN conda env create -f environment.yml

# activate environment manuelly
ENV CONDA_EXE /opt/conda/bin/conda
ENV CONDA_PREFIX /opt/conda/envs/venv
ENV CONDA_PYTHON_EXE /opt/conda/bin/python
ENV CONDA_PROMPT_MODIFIER (venv)
ENV CONDA_DEFAULT_ENV venv
ENV PATH /opt/conda/envs/venv/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN echo "conda activate venv" >> ~/.bashrc

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=5000", "--allow-root"]