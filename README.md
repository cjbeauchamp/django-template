## How to Use

To use this project, follow these steps:

	$ curl -L https://raw.githubusercontent.com/cjbeauchamp/django-template/master/starter.sh | sh -s supdude

## Run it locally
	
	$ // this will open a new tab for redis, worker, and web process
	$ sh runner.sh

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
