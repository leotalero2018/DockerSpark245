FROM cluster-base

# -- Layer: JupyterLab

ARG spark_version=2.4.5
ARG jupyterlab_version=2.1.5

RUN apt-get update -y
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN	pip3 install pypandoc==1.5
RUN pip3 install pyspark==${spark_version}
RUN	pip3 install wget
RUN pip3 install numpy && pip3 install pandas && pip3 install matplotlib
RUN pip3 install scipy
RUN pip3 install jupyterlab==${jupyterlab_version}
RUN rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/local/bin/python3 /usr/bin/python

# -- Runtime

EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=

