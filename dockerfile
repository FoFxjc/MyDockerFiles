FROM ubuntu:16.04

RUN apt-get update && \
        apt-get install -y software-properties-common && \
        add-apt-repository ppa:deadsnakes/ppa  -y && \
        apt-get update -y  && \
        apt-get install -y build-essential python3.6 python3.6-dev python3-pip && \
        update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1 && \
        update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2 && \
        python -m pip install pip --upgrade  && \
        python -m pip install wheel && \
        apt-get install nginx -y && \
        echo mysql-server mysql-server/root_password password 123456 | debconf-set-selections && \
        echo mysql-server mysql-server/root_password_again password 123456 | debconf-set-selections && \
        apt-get -y install mysql-server mysql-client libmysqlclient-dev && \
        service mysql start && \
        mkdir /usr/local/jdk1.8 && \
        apt-get install -y --no-install-recommends tzdata && rm -rf /var/lib/apt/lists/*

ADD ./utils/jdk1.8 /usr/local/jdk1.8

ADD mysqld-start.sh /usr/local/mysqld-start.sh
  
ENV JAVA_HOME /usr/local/jdk1.8
ENV PATH $JAVA_HOME/bin:$PATH

ENTRYPOINT ["/bin/sh","/usr/local/mysqld-start.sh"]

