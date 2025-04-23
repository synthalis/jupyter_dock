FROM condaforge/mambaforge:latest
RUN conda install -c bioconda autodock-vina -y
WORKDIR /data
ENTRYPOINT ["vina"]
