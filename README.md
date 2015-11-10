![Django Template](https://api.travis-ci.org/livingbio/django-template.svg)

# Django Template for GliaCloud

This is a django template for gliacloud

## INSTALLATION & SETTINGS

### Install Django

To install django, type the following command

    sudo pip install django

### Create Django project from the template

To create the project, run the following command and please replace your_project_name to what you like :

    django-admin.py startproject --template=https://github.com/livingbio/django-template/archive/master.zip --extension=py,md,yml your_project_name

### Setting Virtualenv

At first, you should make sure you have [virtualenv](http://www.virtualenv.org/) installed.

after that, just cd to your_project_name:

    cd your_project_name

Then create your virtualenv:

    virtualenv venv

Second, you need to enable the virtualenv by

    source venv/bin/activate

Install all dependencies:

    pip install -r requirements.txt

Settings are stored in environment variables via [django-environ](http://django-environ.readthedocs.org/en/latest/). The quickiest way to start is to rename `local.sample.env`

    mv {{ project_name }}/src/{{ project_name }}/local.sample.env {{ project_name }}/src/{{ project_name }}/local.env

Run migrations:

    python manage.py migrate

### Documentation

You can use [mkdocs](http://www.mkdocs.org/) to write beatuiful documentations. By typing:

    mkdocs serve

Then you can see your document in http://localhost:8001/

### Detailed instructions

Take a look at the docs for more information.



OR


set Docker
===

MAC 
---

download and install docker-toolbox
https://www.docker.com/docker-toolbox

####create docker vm
```
docker-machine create -d virtualbox --virtualbox-import-boot2docker-vm boot2docker-vm docker
```

####set docker env
copy
```
docker-machine start docker
eval `docker-machine env default`
```
paste to ~/.zshrc or ~/.bashrc

ubuntu 14.04
---

reference
http://docs.docker.com/engine/installation/ubuntulinux/

install docker 
```
sudo apt-get update
sudo apt-get install linux-image-generic-lts-trusty
sudo reboot

sudo reboot
sudo apt-get install docker-engine
sudo service docker start
```



docker.sh
===
這是project base 的script
負責幫你用docker 處理 project 的 執行, 測試, 建立環境...etc 固定工作的script

基本上有幾個command
---

####build
`./docker.sh build`
負責用 docker 建立project 的環境

####test
`./docker.sh test`
負責用 docker 跑 project的測試

####run
`./docker.sh run`
負責用 docker 執行script

####runserver
`./docker.sh runserver`
負責用 docker 開啟 django server


