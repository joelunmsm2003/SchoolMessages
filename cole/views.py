from django.views.generic import View
from django.http import HttpResponse

from jwt_auth.compat import json
from jwt_auth.mixins import JSONWebTokenAuthMixin
from cole.models import *
import simplejson


class MockView(JSONWebTokenAuthMixin, View):
    def post(self, request):
        data = json.dumps({'username': request.user.username})
        return HttpResponse(data)


class Estados(JSONWebTokenAuthMixin, View):
    def post(self, request):

		data =  Estado.objects.all().values('id','name')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")

def ValuesQuerySetToDict(vqs):
    return [item for item in vqs]