read -p "Enter the app name => du-" APP_NAME_SUFFIX

django-admin.py startproject \
	--template=https://github.com/cjbeauchamp/django-template/archive/master.zip \
	--name=Procfile \
	--name=gulpfile.js \
	${APP_NAME_SUFFIX}

cd ${APP_NAME_SUFFIX}
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

echo "Creating database locally..."
createdb ${APP_NAME_SUFFIX}

echo "Migrating db"
python manage.py makemigrations ${APP_NAME_SUFFIX}
python manage.py migrate

echo "All done! To deploy, run:"
echo "sh deploy.sh"

echo ""

echo "Or to run locally, use:"
echo "sh runner.sh"