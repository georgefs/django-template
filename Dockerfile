FROM debian:latest
MAINTAINER lucemia <davidchen@gliacloud.com>
# Install software
RUN apt-get update -y
RUN apt-get install python-lxml libpq-dev python-pip -y
RUN apt-get install python-dev -y
ADD requirements.txt /home/requirements.txt
ADD requirements /home/requirements
RUN pip install -r /home/requirements.txt


ADD ./src /home/src

# FIXME
ADD ./logs /home/logs
ADD ./src/{{ project_name }}/settings/local.sample.env /home/src/{{ project_name }}/settings/local.env
RUN (cd /home/src && python manage.py migrate --noinput)
RUN (cd /home/src && python manage.py collectstatic --noinput)

WORKDIR /home/src
