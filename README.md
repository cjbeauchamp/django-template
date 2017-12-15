## How to Use

To use this project, follow these steps:

	$ source <(curl -s https://github.com/cjbeauchamp/django-template/starter.sh) supdude

	$ mkdir helloworld && cd helloworld
	$ virtualenv venv
	$ source venv/bin/activate
	$ pip install django==1.1
    $ django-admin.py startproject --template=https://github.com/cjbeauchamp/django-template/archive/master.zip --name=Procfile helloworld

## Run it locally
	
	$ // redis
	$ redis-server
	
	$ // webserver
	$ heroku local web
	
	$ // worker
	$ heroku local worker

## Deployment to Heroku

    $ git init
    $ git add -A
    $ git commit -m "Initial commit"

    $ heroku create helloworld-staging --remote staging
    $ git push staging master
    $ heroku addons:create heroku-redis:hobby-dev --app helloworld-staging
    $ heroku run python manage.py migrate --app helloworld-staging

    $ heroku create helloworld --remote production
    $ git push production master
    $ heroku addons:create heroku-redis:hobby-dev --app helloworld
    $ heroku run python manage.py migrate --app helloworld

    $ heroku run python manage.py migrate
