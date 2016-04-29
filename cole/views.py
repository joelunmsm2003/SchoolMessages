from django.views.generic import View
from django.http import HttpResponse
from django.contrib.auth.models import Group, User
from jwt_auth.compat import json
from jwt_auth.mixins import JSONWebTokenAuthMixin
from cole.models import *
import simplejson
from django.views.decorators.csrf import csrf_exempt
import xlrd


class Datos(JSONWebTokenAuthMixin, View):
    def get(self, request):

    	id = request.user.id

    	print 'User....',id
    	print Alumno.objects.all()
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


class Adduser(JSONWebTokenAuthMixin, View):
    def post(self, request):

		print json.loads(request.body)

		dato = json.loads(request.body)['dato']
		username = dato['username']
		password = dato['password']
		nivel = dato['nivel']
		first_name = dato['first_name']
		last_name = dato['last_name']
		nombres = dato['nombres']
		distrito = dato['distrito']
		direccion = dato['direccion']
		dni =dato['dni']
		colegio = dato['colegio']
		email= dato['email']
		telefono = dato['telefono']

		user = User.objects.create_user(username=username,password=password)
		user.save()

		id_user = AuthUser.objects.all().values('id').order_by('-id')[0]['id']

		usuario = AuthUser.objects.get(id=id_user)
		usuario.username = username
		usuario.password = password
		usuario.first_name = first_name
		usuario.last_name = last_name
		usuario.nombres = nombres
		usuario.email = email
		usuario.nivel_id = nivel
		usuario.dni = dni
		usuario.direccion = direccion
		usuario.distrito = distrito
		usuario.colegio_id = colegio

		usuario.telefono = telefono
		usuario.save()

		data_json = simplejson.dumps('data_dict')

		return HttpResponse(data_json, content_type="application/json")



class Niveles(JSONWebTokenAuthMixin, View):
    def get(self, request):

		data =  Nivel.objects.all().values('id','nombre')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")

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

			data =  AuthUser.objects.filter(colegio_id=colegio).values('id','first_name','colegio__nombre','email')
		
		if nivel == 2: #Profesor

			profesor = Profesor.objects.get(user=request.user.id)

			data =  Alumnocurso.objects.filter(profesor_id=profesor)

			lista = []

			for a in data:

				lista.insert(0,a.alumno.user.id)

			data =  AuthUser.objects.filter(id__in=lista).values('id','first_name','colegio__nombre','email')

		if nivel == 3: #Alumno

			data =  AuthUser.objects.filter(colegio_id=colegio).values('id','first_name','colegio__nombre','email')

		if nivel == 4: #Secretario

			data =  AuthUser.objects.filter(colegio_id=colegio).values('id','first_name','colegio__nombre','email')

		if nivel == 5: #Admin

			data =  AuthUser.objects.filter(colegio_id=colegio).values('id','first_name','colegio__nombre','email')

		if nivel == 6: #Manager

			data =  AuthUser.objects.all().values('id','is_superuser','first_name','last_name','nombres','email','nivel__nombre','colegio','dni','direccion','distrito').order_by('-id')


		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")




class Periodos(JSONWebTokenAuthMixin, View):
    def get(self, request,user):
    
		data =  Alumno.objects.filter(user_id=user).values('id','user__first_name','anio__nombre','periodo__nombre','seccion__nombre','grado__nombre','niveleducativo__nombre','promedio','puesto')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")

class Colegionivelx(JSONWebTokenAuthMixin, View):
    def get(self,request,colegio):
    
		data =  Colegionivel.objects.filter(colegio_id=colegio).values('id','colegio__nombre','nivel__nombre','colegio')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")

class Nivelgradox(JSONWebTokenAuthMixin, View):
    def get(self,request,nivel):
    
		data =  Nivelgrado.objects.filter(nivel_id=nivel).values('id','grado__nombre','nivel__nombre')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")

class Alumnoseccion(JSONWebTokenAuthMixin, View):
    def post(self,request):


		data = json.loads(request.body)
		niveleducativo = data['nivel']
		grado = data['grado']
		seccion = data['seccion']
		colegio = data['colegio']
    
		data =  Alumno.objects.filter(niveleducativo_id=niveleducativo,grado_id=grado,seccion_id=seccion,user__colegio=colegio).values('id','user__first_name','grado__nombre','seccion__nombre','niveleducativo__nombre','user__colegio__nombre','promedio','puesto','user')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")



class Secciongradox(JSONWebTokenAuthMixin, View):
    def get(self,request,grado):
    
		data =  Gradoseccion.objects.filter(grado_id=grado).values('id','seccion__nombre','grado__nombre')

		data_dict = ValuesQuerySetToDict(data)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")




@csrf_exempt
def uploaduser(request):


		print request.FILES['process_file']

   
		filex = request.FILES['process_file']

		Excel(file=filex).save()

		id_excel = Excel.objects.all().values('id').order_by('-id')[0]['id']

		archivo = Excel.objects.get(id=id_excel).file

		ruta = '/var/www/html/'+str(archivo)

		book = xlrd.open_workbook(ruta)

		sh = book.sheet_by_index(0)

		u=[]

		i=0

		for rx in range(sh.nrows):

			if rx > 0:

				u=[]

				ui=0

				users = User.objects.all()

				for col in range(sh.ncols):

					x = str(sh.row(rx)[col]).replace('text:u','').replace('number:','').replace("'","").replace('.0','')

					u.append(x)

				username =u[0]
				password =u[1]
				appaterno = u[2]
				apmaterno = u[3]
				nombres = u[4]
				email = u[5]
				nivel =u[6]
				dni = u[7]
				direccion = u[8]
				distrito = u[9]
				fnacimiento =u[10]
				telefono = u[11]

				for users in users:

					if username == users.username:

						ui = 1

				if ui == 0:

					i = i+1

					user = User.objects.create_user(username=username,password=password)
					user.save()

					id_user = AuthUser.objects.all().values('id').order_by('-id')[0]['id']

					usuario = AuthUser.objects.get(id=id_user)
					usuario.username = username
					usuario.password = password
					usuario.first_name = appaterno
					usuario.last_name = apmaterno
					usuario.nombres = nombres
					usuario.email = email
					usuario.nivel_id = nivel
					usuario.dni = dni
					usuario.direccion = direccion
					usuario.distrito = distrito
					
					usuario.telefono = telefono
					usuario.save()


			

			


		return HttpResponse(i, content_type="application/json")


def ValuesQuerySetToDict(vqs):

    return [item for item in vqs]