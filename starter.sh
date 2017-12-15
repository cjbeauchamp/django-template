mkdir $1 && cd $1
virtualenv venv
source venv/bin/activate
pip install django==1.1
django-admin.py startproject --template=https://github.com/cjbeauchamp/django-template/archive/master.zip --name=Procfile $1
