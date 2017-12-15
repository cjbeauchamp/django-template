To install a new lib:

	$ cd ./project_name/static/lib
	$ npm i --prefix ./ --save-dev module_to_install

The libraries pre-configured in this subdir `package.json` are run from the main `package.json` in a postinstall script. This will also cover heroku installs.