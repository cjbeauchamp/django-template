read -p "Enter the app name => du-" APP_NAME_SUFFIX

git init
git add -A
git commit -m "Initial commit"

APP_NAME="du-${APP_NAME_SUFFIX}"
APP_NAME_STAGING="${APP_NAME}-staging"

heroku create ${APP_NAME_STAGING} --remote staging
git push staging master
heroku addons:create logentries:le_tryit --app ${APP_NAME_STAGING}
heroku addons:create heroku-redis:hobby-dev --app ${APP_NAME_STAGING}
heroku run python manage.py migrate --app ${APP_NAME_STAGING}

heroku create ${APP_NAME} --remote production
git push production master
heroku addons:create logentries:le_tryit --app ${APP_NAME}
heroku addons:create heroku-redis:hobby-dev --app ${APP_NAME}
heroku run python manage.py migrate --app ${APP_NAME}
