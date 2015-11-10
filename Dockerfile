FROM ubuntu
MAINTAINER georgeli <georgeli@gliacloud.com>
# Install software

RUN apt-get update
RUN apt-get install python-lxml libpq-dev -y
RUN apt-get install python-setuptools python-dev libffi-dev -y
RUN easy_install pip
RUN apt-get install automake libtool  -y
RUN apt-get install build-essential -y
ADD requirements.txt /home/requirements.txt
ADD requirements /home/requirements
RUN pip install -r /home/requirements.txt

ADD api /home/api
WORKDIR /home/api
