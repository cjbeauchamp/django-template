APP_NAME_SUFFIX=$1

django-admin.py startproject \
	--template=https://github.com/cjbeauchamp/django-template/archive/master.zip \
	--name=Procfile \
	--name=gulpfile.js \
	--name=./project_name/static/lib/package.json \
	--name=./${APP_NAME_SUFFIX}/static/lib/package.json \
	${APP_NAME_SUFFIX}

cd ${APP_NAME_SUFFIX}

echo "Setting up our virtual environment..."
virtualenv venv
source venv/bin/activate

echo "Installing our node modules..."
pip install -r requirements.txt

echo "Installing our node modules..."
npm install
./node_modules/recursive-install/recursive-install.js 

echo "Compiling our resources..."
gulp compile

echo "Creating database locally..."
createdb ${APP_NAME_SUFFIX}

echo "Migrating db..."
python manage.py makemigrations ${APP_NAME_SUFFIX}
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic

echo "All done! To deploy, run:"
echo "sh deploy.sh"

echo ""

echo "Or to run locally, use:"
echo "source runner.sh"

echo ""

echo "Don't forget to create a superuser:"
echo "python manage.py createsuperuser"