from django.views.generic import View
from django.http import HttpResponse

from jwt_auth.compat import json
from jwt_auth.mixins import JSONWebTokenAuthMixin
from cole.models import *
import simplejson


class Datos(JSONWebTokenAuthMixin, View):
    def get(self, request):

    	id = request.user.id
    	user = AuthUser.objects.get(id=id)
    	nivel = user.nivel.id
    	nivel_nombre = user.nivel.nombre
    	colegio = user.colegio.nombre
    	first_name = user.first_name

        data = json.dumps({'first_name':first_name,'username': request.user.username,'id':id,'nivel':nivel,'nivel_nombre':nivel_nombre,'colegio':colegio})
        return HttpResponse(data)


class Colegios(JSONWebTokenAuthMixin, View):
    def get(self, request):

		data =  Colegio.objects.all().values('id','nombre','direccion')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")



class Cursito(JSONWebTokenAuthMixin, View):
    def get(self,request,alumno):

		data =  Alumnocurso.objects.filter(alumno_id=alumno).values('id','curso__nombre','profesor__user__first_name')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")



class Useralumno(JSONWebTokenAuthMixin, View):

    def get(self,request):

		nivel = AuthUser.objects.get(id=request.user.id).nivel.id

		colegio = AuthUser.objects.get(id=request.user.id).colegio.id

		if nivel == 1: #Director

			data =  AuthUser.objects.filter(colegio_id=colegio,nivel_id=3).values('id','first_name','colegio__nombre','email')
		
		if nivel == 2: #Profesor

			profesor = Profesor.objects.get(user=request.user.id)

			data =  Alumnocurso.objects.filter(profesor_id=profesor)

			lista = []

			for a in data:

				lista.insert(0,a.alumno.user.id)

			data =  AuthUser.objects.filter(id__in=lista).values('id','first_name','colegio__nombre','email')

		if nivel == 3: #Alumno

			data =  AuthUser.objects.filter(colegio_id=colegio,nivel_id=3).values('id','first_name','colegio__nombre','email')

		if nivel == 4: #Secretario

			data =  AuthUser.objects.filter(colegio_id=colegio,nivel_id=3).values('id','first_name','colegio__nombre','email')

		if nivel == 5: #Admin

			data =  AuthUser.objects.filter(colegio_id=colegio,nivel_id=3).values('id','first_name','colegio__nombre','email')

		if nivel == 6: #Manager

			data =  AuthUser.objects.filter(nivel_id=3).values('id','first_name','colegio__nombre','email')


		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")


class Periodos(JSONWebTokenAuthMixin, View):
    def get(self, request,user):
    
		data =  Alumno.objects.filter(user_id=user).values('id','user__first_name','anio__nombre','periodo__nombre','seccion__nombre','grado__nombre','niveleducativo__nombre','promedio','puesto')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")


    	



def ValuesQuerySetToDict(vqs):
    return [item for item in vqs]