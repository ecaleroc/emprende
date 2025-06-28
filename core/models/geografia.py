from django.db import models
from django.utils.translation import gettext_lazy as _

class Pais(models.Model):
    idpais = models.AutoField(db_column='IDPAIS', primary_key=True)  # Field name made lowercase.
    iso = models.CharField(db_column='ISO', max_length=2, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=80, blank=True, null=True)  # Field name made lowercase.
    isban = models.IntegerField(db_column='ISBAN', blank=True, null=True)  # Field name made lowercase.
    idioma = models.CharField(db_column='IDIOMA', max_length=60, blank=True, null=True)  # Field name made lowercase.
    prefijo_tel = models.CharField(db_column='PREFIJO_TEL', max_length=4, blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'PAIS'
        verbose_name = 'País'
        verbose_name_plural = 'Países'
        ordering = ['nombre']

    def __str__(self):
        return self.nombre or f"País {self.id}"

class Departamento(models.Model):
    iddepartamento = models.CharField(db_column='IDDEPARTAMENTO', primary_key=True, max_length=6)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=145, blank=True, null=True)  # Field name made lowercase.
    updated_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    idpais = models.ForeignKey('Pais', models.DO_NOTHING, db_column='IDPAIS')  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=2, blank=True, null=True)  # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'DEPARTAMENTO'
        verbose_name = 'Departamento'
        verbose_name_plural = 'Departamentos'
        ordering = ['nombre']

    def __str__(self):
        return self.nombre or f"Departamento {self.iddepartamento}"

class Provincia(models.Model):
    idprovincia = models.CharField(db_column='IDPROVINCIA', primary_key=True, max_length=6)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=145, blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    iddepartamento = models.ForeignKey(Departamento, models.DO_NOTHING, db_column='IDDEPARTAMENTO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PROVINCIA'
        verbose_name = 'Provincia'
        verbose_name_plural = 'Provincias'
        ordering = ['nombre']

    def __str__(self):
        return self.nombre or f"Provincia {self.idprovincia}"

class Distrito(models.Model):
    iddistrito = models.CharField(db_column='IDDISTRITO', primary_key=True, max_length=6)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=145, blank=True, null=True)  # Field name made lowercase.
    iddepartamento = models.CharField(db_column='IDDEPARTAMENTO', max_length=6, blank=True, null=True)  # Field name made lowercase.
    idprovincia = models.ForeignKey('Provincia', models.DO_NOTHING, db_column='IDPROVINCIA')  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'DISTRITO'
        verbose_name = 'Distrito'
        verbose_name_plural = 'Distritos'
        ordering = ['nombre']

    def __str__(self):
        return self.nombre or f"Distrito {self.iddistrito}"

class Direccion(models.Model):
    iddireccion = models.AutoField(db_column='IDDIRECCION', primary_key=True)  # Field name made lowercase.
    tipo = models.IntegerField(db_column='TIPO', blank=True, null=True, db_comment='DOMICILIO, TRABAJO, CASA-PLAYA, ETC')  # Field name made lowercase.
    tipo_zona = models.IntegerField(db_column='TIPO_ZONA', blank=True, null=True, db_comment='URBANIZACIËN / CONJ. HABITACIONAL / ETC.\n')  # Field name made lowercase.
    nombre_zona = models.CharField(db_column='NOMBRE_ZONA', max_length=245, blank=True, null=True, db_comment='LAS LOMAS / LAS VIÐAS / ETC.\n')  # Field name made lowercase.
    tipo_via = models.CharField(db_column='TIPO_VIA', max_length=245, blank=True, null=True, db_comment='AV / JIRON / PROLONGACIËN / CALLE / ETC.')  # Field name made lowercase.
    nomb_via = models.CharField(db_column='NOMB_VIA', max_length=245, blank=True, null=True)  # Field name made lowercase.
    tipo_exterior = models.CharField(db_column='TIPO_EXTERIOR', max_length=45, blank=True, null=True, db_comment='NRO, KM, MZ LT\n')  # Field name made lowercase.
    valor_exterior = models.CharField(db_column='VALOR_EXTERIOR', max_length=45, blank=True, null=True)  # Field name made lowercase.
    tipo_interior = models.CharField(db_column='TIPO_INTERIOR', max_length=45, blank=True, null=True, db_comment='DPT., HABITACION, INTERIOR\n')  # Field name made lowercase.
    valor_interior = models.CharField(db_column='VALOR_INTERIOR', max_length=45, blank=True, null=True)  # Field name made lowercase.
    piso = models.CharField(db_column='PISO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    latitud = models.FloatField(db_column='LATITUD', blank=True, null=True)  # Field name made lowercase.
    longitud = models.FloatField(db_column='LONGITUD', blank=True, null=True)  # Field name made lowercase.
    iddistrito = models.ForeignKey('Distrito', models.DO_NOTHING, db_column='IDDISTRITO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DIRECCION'
        verbose_name = 'Dirección'
        verbose_name_plural = 'Direcciones'

    def __str__(self):
        return self.direccion_completa()

    def direccion_completa(self):
        parts = []
        if self.tipo_via:
            parts.append(f"{self.get_tipo_via_display()} {self.nomb_via or ''}")
        if self.tipo_exterior and self.valor_exterior:
            parts.append(f"{self.get_tipo_exterior_display()} {self.valor_exterior}")
        if self.tipo_interior and self.valor_interior:
            parts.append(f"{self.get_tipo_interior_display()} {self.valor_interior}")
        if self.piso:
            parts.append(f"Piso {self.piso}")
        if self.nombre_zona:
            parts.append(f"Zona {self.nombre_zona}")
        if self.iddistrito:
            parts.append(str(self.iddistrito))
        return ", ".join(parts)

class PersonaDireccion(models.Model):
    idpersona = models.OneToOneField('Persona', models.DO_NOTHING, db_column='IDPERSONA', primary_key=True)  # Field name made lowercase. The composite primary key (IDPERSONA, IDDIRECCION) found, that is not supported. The first column is selected.
    iddireccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='IDDIRECCION')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    estado_principal = models.IntegerField(db_column='ESTADO_PRINCIPAL', blank=True, null=True, db_comment='0: NORMAL 1: PRINCIPAL')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PERSONA_DIRECCION'
        verbose_name = 'Dirección de Persona'
        verbose_name_plural = 'Direcciones de Personas'
        unique_together = (('idpersona', 'iddireccion'),)

    def __str__(self):
        return f"{self.idpersona} - {self.iddireccion}"