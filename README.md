# Django Template for GliaCloud

This is a django template for gliacloud

## INSTALLATION & SETTINGS

### Install Django

To install django, type the following command

    sudo pip install django

### Create Django project from the template

To create the project, run the following command and please replace your\_project_name to what you like :

    django-admin.py startproject --template=https://github.com/livingbio/django-template/archive/master.zip --extension=py,rst,html your_project_name

### Setting Virtualenv

At first, you should make sure you have [virtualenv](http://www.virtualenv.org/) installed.

after that, just cd to your\_project_name:

    cd your\_project_name

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


### Detailed instructions

Take a look at the docs for more information.

