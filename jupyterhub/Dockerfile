FROM fedora:33

# set versions
ARG MINICONDA_VERSION
ARG MD5

# set environment
ENV TZ=Europe/Amsterdam
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PATH=/opt/conda/bin:$PATH

# install system packages
RUN dnf -y update && \
    dnf -y install \
    wget \
    git \
    bzip2 \
    passwd \
    zsh

# install Python + NodeJS with conda and Python-packages
RUN wget https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -O /tmp/miniconda.sh  && \
    echo -e "${MD5} */tmp/miniconda.sh" | md5sum -c - && \
    bash /tmp/miniconda.sh -f -b -p /opt/conda && \
    /opt/conda/bin/conda install --yes -c conda-forge \
      python \
      sqlalchemy \
      tornado \
      jinja2 \
      traitlets \
      requests \
      pip \
      pycurl \
      nodejs \
      configurable-http-proxy \
      notebook \
      jupyterlab \
      jupyterlab-git \
      jupyterhub \
      conda-build \
      nb_conda_kernels \
      ipykernel \
      && \
    /opt/conda/bin/pip install --upgrade pip && \
    /opt/conda/bin/jupyter lab build && \
    rm /tmp/miniconda.sh

# create working directory
RUN mkdir -p /srv/jupyterhub/
WORKDIR /srv/jupyterhub/

# create admin group
RUN groupadd jupyterhub-admins

# expose standard port for jupyterhub
EXPOSE 8000

CMD ["jupyterhub"]
