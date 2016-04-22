from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'colegio.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
	url(r'^api-token-auth/', 'jwt_auth.views.obtain_jwt_token'),
	url(r'^jwt/$', MockView.as_view()),
	url(r'^estados/$', Estados.as_view()),






)
