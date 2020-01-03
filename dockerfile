FROM ubuntu:16.04

RUN apt-get update && \
        apt-get install -y software-properties-common && \
        add-apt-repository ppa:deadsnakes/ppa && \
        apt-get update -y  && \
        apt-get install -y build-essential python3.6 python3.6-dev python3-pip && \
        apt-get install -y git  && \
        # update pip
        python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel && \
        update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1 && \
        update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2 && \
        update-alternatives --install /usr/bin/python python /usr/bin/python3.6 3 &&