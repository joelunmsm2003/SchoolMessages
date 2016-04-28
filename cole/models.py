# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class Alumno(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey('AuthUser', db_column='user')
    anio = models.ForeignKey('Anio', db_column='anio', blank=True, null=True)
    periodo = models.ForeignKey('Periodo', db_column='periodo')
    seccion = models.ForeignKey('Seccion', db_column='seccion', blank=True, null=True)
    grado = models.ForeignKey('Grado', db_column='grado', blank=True, null=True)
    niveleducativo = models.ForeignKey('Niveleducativo', db_column='niveleducativo', blank=True, null=True)
    promedio = models.IntegerField(blank=True, null=True)
    puesto = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'alumno'


class Alumnocurso(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    alumno = models.ForeignKey(Alumno, db_column='alumno', blank=True, null=True)
    curso = models.ForeignKey('Cursos', db_column='curso', blank=True, null=True)
    profesor = models.ForeignKey('Profesor', db_column='profesor', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'alumnocurso'


class Anio(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'anio'


class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey('AuthPermission')

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'


class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(max_length=50)
    content_type = models.ForeignKey('DjangoContentType')
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'


class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField()
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    nombres = models.CharField(max_length=100, blank=True)
    email = models.CharField(max_length=75)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()
    nivel = models.ForeignKey('Nivel', db_column='nivel', blank=True, null=True)
    colegio = models.ForeignKey('Colegio', db_column='colegio', blank=True, null=True)
    dni = models.CharField(max_length=100, blank=True)
    direccion = models.CharField(max_length=100, blank=True)
    distrito = models.CharField(max_length=100, blank=True)
    fnacimiento = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'


class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'


class Colegio(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.CharField(max_length=100, blank=True)
    direccion = models.CharField(max_length=100, blank=True)

    class Meta:
        managed = False
        db_table = 'colegio'


class Colegionivel(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    colegio = models.ForeignKey(Colegio, db_column='colegio', blank=True, null=True)
    nivel = models.ForeignKey('Niveleducativo', db_column='nivel', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'colegionivel'


class CorsheadersCorsmodel(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    cors = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'corsheaders_corsmodel'


class Cursos(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.CharField(max_length=100, blank=True)
    niveleducativo = models.IntegerField(blank=True, null=True)
    grado = models.IntegerField(blank=True, null=True)
    colegio = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cursos'


class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.IntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True)
    user = models.ForeignKey(AuthUser)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(max_length=100)
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'


class DjangoMigrations(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Excel(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    file = models.CharField(max_length=1000, blank=True)

    class Meta:
        managed = False
        db_table = 'excel'


class Grado(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.CharField(max_length=100, blank=True)

    class Meta:
        managed = False
        db_table = 'grado'


class Gradoseccion(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    grado = models.ForeignKey(Grado, db_column='grado', blank=True, null=True)
    seccion = models.ForeignKey('Seccion', db_column='seccion', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gradoseccion'


class Nivel(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.CharField(max_length=100, blank=True)

    class Meta:
        managed = False
        db_table = 'nivel'


class Niveleducativo(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.CharField(max_length=100, blank=True)

    class Meta:
        managed = False
        db_table = 'niveleducativo'


class Nivelgrado(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nivel = models.ForeignKey(Niveleducativo, db_column='nivel', blank=True, null=True)
    grado = models.ForeignKey(Grado, db_column='grado', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'nivelgrado'


class Periodo(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.CharField(max_length=100, blank=True)

    class Meta:
        managed = False
        db_table = 'periodo'


class Profesor(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser, db_column='user', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'profesor'


class Seccion(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    nombre = models.CharField(max_length=100, blank=True)

    class Meta:
        managed = False
        db_table = 'seccion'
