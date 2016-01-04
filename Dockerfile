FROM debian:latest
MAINTAINER lucemia <davidchen@gliacloud.com>
# Install software
RUN apt-get update -y
RUN apt-get install python-lxml libpq-dev python-pip -y
RUN apt-get install python-dev -y
ADD requirements* /home/
RUN pip install -r /home/requirements.txt

ADD ./src /home/src
WORKDIR /home/src
