from django.shortcuts import render

import logging
logger = logging.getLogger("{{ project_name }}")

def index(request):
	return render(request, 'index.html')
