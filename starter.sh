read -p "Enter the app name => du-" APP_NAME_SUFFIX

django-admin.py startproject --template=https://github.com/cjbeauchamp/django-template/archive/master.zip --name=Procfile ${APP_NAME_SUFFIX}
cd ${APP_NAME_SUFFIX}
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

echo "All done! To deploy, run:"
echo "sh deploy.sh"