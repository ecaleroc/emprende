from django.db import models
from django.utils.translation import gettext_lazy as _

class Persona(models.Model):
    idpersona = models.AutoField(db_column='IDPERSONA', primary_key=True)  # Field name made lowercase.
    tipodocumento = models.IntegerField(db_column='TIPODOCUMENTO', blank=True, null=True)  # Field name made lowercase.
    nrodocumento = models.CharField(db_column='NRODOCUMENTO', max_length=15, blank=True, null=True)  # Field name made lowercase.
    nombres = models.CharField(db_column='NOMBRES', max_length=150, blank=True, null=True)  # Field name made lowercase.
    apellido_paterno = models.CharField(db_column='APELLIDO_PATERNO', max_length=120, blank=True, null=True)  # Field name made lowercase.
    apellido_materno = models.CharField(db_column='APELLIDO_MATERNO', max_length=120, blank=True, null=True)  # Field name made lowercase.
    foto = models.CharField(db_column='FOTO', max_length=330, blank=True, null=True)  # Field name made lowercase.
    fecha_nacimiento = models.DateField(db_column='FECHA_NACIMIENTO', blank=True, null=True)  # Field name made lowercase.
    genero = models.IntegerField(db_column='GENERO', blank=True, null=True, db_comment='M:MASCULINO/F:FEMENINO')  # Field name made lowercase.
    creador_registro = models.IntegerField(db_column='CREADOR_REGISTRO', blank=True, null=True)  # Field name made lowercase.
    systema = models.CharField(db_column='SYSTEMA', max_length=10, blank=True, null=True)  # Field name made lowercase.
    tipo_persona = models.IntegerField(db_column='TIPO_PERSONA', blank=True, null=True, db_comment='Natural / Juridica')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='Son restricciones: no vivo / restriccion legal /')  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'PERSONA'
        verbose_name = 'Persona'
        verbose_name_plural = 'Personas'
        ordering = ['apellido_paterno', 'apellido_materno', 'nombres']
    def nombre_completo(self):
        return f"{self.nombres} {self.apellido_paterno} {self.apellido_materno or ''}".strip()

    @property
    def edad(self):
        if self.fecha_nacimiento:
            from datetime import date
            today = date.today()
            return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
        return None

    def __str__(self):
        return f"{self.apellido_paterno} {self.apellido_materno or ''}, {self.nombres}"

class PersonaContacto(models.Model):
    idcontacto = models.AutoField(db_column='IDCONTACTO', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    tipo = models.CharField(db_column='TIPO', max_length=20, blank=True, null=True, db_comment='T:TELEFONO / C:CORREO / D:DIRECCION ')  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=120, blank=True, null=True)  # Field name made lowercase.
    descripcion_corta = models.CharField(db_column='DESCRIPCION_CORTA', max_length=20, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True, db_comment='V:VERIFICACION / A:ALTA / B:BAJA')  # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'PERSONA_CONTACTO'
        verbose_name = 'Contacto de Persona'
        verbose_name_plural = 'Contactos de Personas'

    def __str__(self):
        return f"{self.get_tipo_display()}: {self.descripcion}"

class Cliente(models.Model):
    idcliente = models.AutoField(db_column='IDCLIENTE', primary_key=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True)  # Field name made lowercase.
    tipo_cliente = models.CharField(db_column='TIPO_CLIENTE', max_length=1, blank=True, null=True)  # Field name made lowercase.
    monto_ultima_compra = models.DecimalField(db_column='MONTO_ULTIMA_COMPRA', max_digits=5, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    cuenta_bancaria = models.IntegerField(db_column='CUENTA_BANCARIA', blank=True, null=True)  # Field name made lowercase.
    calificacion = models.DecimalField(db_column='CALIFICACION', max_digits=2, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    fecha_baja = models.DateTimeField(db_column='FECHA_BAJA', blank=True, null=True)  # Field name made lowercase.
    fecha_activacion = models.DateTimeField(db_column='FECHA_ACTIVACION', blank=True, null=True)  # Field name made lowercase.
    total_pedidos = models.IntegerField(db_column='TOTAL_PEDIDOS', blank=True, null=True)  # Field name made lowercase.
    total_atendidos = models.IntegerField(db_column='TOTAL_ATENDIDOS', blank=True, null=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'CLIENTE'
        verbose_name = 'Cliente'
        verbose_name_plural = 'Clientes'

    def __str__(self):
        return f"Cliente {self.idpersona.nombre_completo()}"

class Personal(models.Model):
    idpersonal = models.AutoField(db_column='IDPERSONAL', primary_key=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=10, blank=True, null=True)  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    nrolicencia = models.CharField(db_column='NROLICENCIA', max_length=11, blank=True, null=True)  # Field name made lowercase.
    catlicencia = models.CharField(db_column='CATLICENCIA', max_length=11, blank=True, null=True)  # Field name made lowercase.
    fecha_emision_licencia = models.DateField(db_column='FECHA_EMISION_LICENCIA', blank=True, null=True)  # Field name made lowercase.
    fecha_caducidad_licencia = models.DateField(db_column='FECHA_CADUCIDAD_LICENCIA', blank=True, null=True)  # Field name made lowercase.
    foto = models.IntegerField(db_column='FOTO', blank=True, null=True, db_comment='EXTRAE TABLA DOCADJUNTO')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='19: ACTIVO / 20: INACTIVO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PERSONAL'
        verbose_name = 'Personal'
        verbose_name_plural = 'Personal'

    def __str__(self):
        return f"{self.idpersona.nombre_completo()} - {self.codigo or 'Sin código'}"

    @property
    def licencia_valida(self):
        if self.fecha_caducidad_licencia:
            from datetime import date
            return date.today() <= self.fecha_caducidad_licencia
        return False