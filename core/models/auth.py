from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin, AbstractUser

from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from core.models.persona import Persona


class Login(models.Model):
    access_token = models.TextField()
    expires_in = models.IntegerField()
    iat_in = models.IntegerField(verbose_name='Tiempo de inicio de login')
    token_type = models.CharField(max_length=8)
    scope = models.CharField(max_length=45)
    refresh_token = models.TextField()
    fecha_ingreso = models.DateTimeField(auto_now=True)
    estado = models.IntegerField()
    tipo_acceso = models.CharField(max_length=45, choices=[
        ('FACEBOOK', 'Facebook'),
        ('GOOGLE', 'Google'),
        ('NORMAL', 'Normal')
    ])
    #idusuario = models.ForeignKey('Usuario', on_delete=models.CASCADE, db_column='IDUSUARIO')
    idusuario = models.ForeignKey(
        'Usuario',  # Referencia directa al modelo
        on_delete=models.CASCADE,
        db_column='IDUSUARIO'
    )
    nro_ingresos = models.IntegerField(default=0)

    class Meta:
        db_table = 'LOGIN'
        verbose_name = 'Login'
        verbose_name_plural = 'Logins'

class Rol(models.Model):
    nombre = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=150)
    estado = models.IntegerField(choices=[
        (1, 'Activo'),
        (0, 'Inactivo'),
        (2, 'Bloqueado')
    ])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'ROL'
        verbose_name = 'Rol'
        verbose_name_plural = 'Roles'

    def __str__(self):
        return self.nombre

class UsuarioRol(models.Model):
    idusuario = models.ForeignKey('Usuario', on_delete=models.CASCADE, db_column='IDUSUARIO')
    idrol = models.ForeignKey(Rol, on_delete=models.CASCADE, db_column='IDROL')
    estado = models.IntegerField(choices=[
        (1, 'Activo'),
        (0, 'Inactivo')
    ])
    syscreacion = models.DateTimeField(auto_now_add=True)
    sysactualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'USUARIO_ROL'
        verbose_name = 'Usuario Rol'
        verbose_name_plural = 'Usuarios Roles'
        unique_together = ('idusuario', 'idrol')

class Modulos(models.Model):
    nombre = models.CharField(max_length=150)
    nombre_corto = models.CharField(max_length=50)
    ruta = models.CharField(max_length=255)
    estado = models.IntegerField()

    class Meta:
        db_table = 'MODULOS'
        verbose_name = 'Módulo'
        verbose_name_plural = 'Módulos'

    def __str__(self):
        return self.nombre

class ObjAcceso(models.Model):
    codigo = models.CharField(max_length=50)
    nombre = models.CharField(max_length=150)
    idmodulo = models.ForeignKey(Modulos, on_delete=models.CASCADE, db_column='IDMODULO')
    ruta = models.CharField(max_length=255)
    controlador = models.CharField(max_length=255)
    estado = models.IntegerField()
    middleware = models.IntegerField()

    class Meta:
        db_table = 'OBJACCESO'
        verbose_name = 'Objeto de Acceso'
        verbose_name_plural = 'Objetos de Acceso'

    def __str__(self):
        return self.nombre

class Permiso(models.Model):
    #idusuario = models.ForeignKey('Usuario', on_delete=models.CASCADE, db_column='IDUSUARIO')
    idusuario = models.ForeignKey(
        'Usuario',
        on_delete=models.CASCADE,
        db_column='IDUSUARIO'
    )
    idobjacceso = models.ForeignKey(ObjAcceso, on_delete=models.CASCADE, db_column='IDOBJACCESO')
    tipo = models.CharField(max_length=1, choices=[
        ('P', 'Permitido'),
        ('B', 'Bloqueado')
    ])
    estado = models.CharField(max_length=1, choices=[
        ('A', 'Activo'),
        ('I', 'Inactivo')
    ])
    syscreacion = models.DateTimeField(auto_now_add=True)
    sysactualizacion = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'PERMISO'
        verbose_name = 'Permiso'
        verbose_name_plural = 'Permisos'
        unique_together = ('idusuario', 'idobjacceso')

class Acceso(models.Model):
    idrol = models.ForeignKey(Rol, on_delete=models.CASCADE, db_column='IDROL')
    idobjacceso = models.ForeignKey(ObjAcceso, on_delete=models.CASCADE, db_column='IDOBJACCESO')
    estado = models.IntegerField(null=True, blank=True, 
                               help_text='A:ACTIVO/I:INACTIVO/P:PENDIENTE/')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'ACCESO'
        verbose_name = 'Acceso'
        verbose_name_plural = 'Accesos'
        unique_together = ('idrol', 'idobjacceso')