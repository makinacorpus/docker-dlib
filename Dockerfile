FROM python:3.6-slim-stretch

RUN apt-get -y update
RUN apt-get install -y --allow-unauthenticated \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN python3 -m pip install numpy

RUN cd ~ && \
    mkdir -p dlib && \
    git clone -b `basename $(curl -fs -o/dev/null -w %{redirect_url} https://github.com/davisking/dlib/releases/latest)` --single-branch https://github.com/davisking/dlib.git dlib/ && \
    cd dlib/ && \
    python3 setup.py install
