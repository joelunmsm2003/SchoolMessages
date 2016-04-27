from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf.urls import patterns
from cole.views import *

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'colegio.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
	url(r'^api-token-auth/', 'jwt_auth.views.obtain_jwt_token'),
	url(r'^datos/$', Datos.as_view()),
	url(r'^colegios/$', Colegios.as_view()),
	url(r'^periodos/(\d+)/$', Periodos.as_view()),
	url(r'^cursos/(\d+)/$', Cursito.as_view()),
	url(r'^useralumno/$', Useralumno.as_view()),
	url(r'^niveles/$', Niveles.as_view()),
	url(r'^uploaduser/$', 'cole.views.uploaduser'),
	url(r'^adduser/$', Adduser.as_view()),

)
