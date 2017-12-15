from django.conf.urls import include, url

zeropatterns = [
    # url(r'^user/create$', user.create.main, name="user_create"),
]

urlpatterns = [
	url(r'^', include(zeropatterns))
]