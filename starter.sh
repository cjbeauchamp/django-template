APP_NAME_SUFFIX=$1

django-admin.py startproject \
	--template=https://github.com/cjbeauchamp/django-template/archive/master.zip \
	--name=Procfile \
	--name=gulpfile.js \
	${APP_NAME_SUFFIX}

cd ${APP_NAME_SUFFIX}

echo "Setting up our virtual environment..."
virtualenv venv
source venv/bin/activate

echo "Installing our node modules..."
pip install -r requirements.txt

echo "Installing our node modules..."
npm install

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