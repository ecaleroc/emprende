from django.db import models
from django.utils.translation import gettext_lazy as _
from core.models.persona import Persona

class Empresa(models.Model):
    idempresa = models.AutoField(db_column='IDEMPRESA', primary_key=True)  # Field name made lowercase.
    rubro = models.CharField(db_column='RUBRO', max_length=145, blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=445, blank=True, null=True)  # Field name made lowercase.
    tipo_comercio = models.IntegerField(db_column='TIPO_COMERCIO', blank=True, null=True, db_comment='Lista de comercios y tipo de actividad: IDCATALOGOTABLAS=31')  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    tipo_empresa = models.IntegerField(db_column='TIPO_EMPRESA', blank=True, null=True, db_comment='Lista de cargos: IDCATALOGOTABLAS=49')  # Field name made lowercase.
    firma_documento = models.IntegerField(db_column='FIRMA_DOCUMENTO', blank=True, null=True, db_comment='Lista de cargos: IDCATALOGOTABLAS=50')  # Field name made lowercase.
    nro_socios = models.IntegerField(db_column='NRO_SOCIOS', blank=True, null=True)  # Field name made lowercase.
    estado_reserva_nombre = models.IntegerField(db_column='ESTADO_RESERVA_NOMBRE', blank=True, null=True, db_comment='Lista de cargos: IDCATALOGOTABLAS=51')  # Field name made lowercase.
    tipo_aporte = models.IntegerField(db_column='TIPO_APORTE', blank=True, null=True, db_comment='Lista de cargos: IDCATALOGOTABLAS=52')  # Field name made lowercase.
    rango_capital = models.CharField(db_column='RANGO_CAPITAL', max_length=255, blank=True, null=True)  # Field name made lowercase.
    estado_politica = models.IntegerField(db_column='ESTADO_POLITICA', blank=True, null=True, db_comment='Lista de cargos: IDCATALOGOTABLAS=5')  # Field name made lowercase.
    capital_monetario = models.DecimalField(db_column='CAPITAL_MONETARIO', max_digits=15, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    actividad_negocio = models.TextField(db_column='ACTIVIDAD_NEGOCIO', blank=True, null=True)  # Field name made lowercase.
    estado_constitucion = models.IntegerField(db_column='ESTADO_CONSTITUCION', blank=True, null=True, db_comment='IDTABLA DE TAB_TABLAS')  # Field name made lowercase.
    fecha_inicio_proceso = models.DateTimeField(db_column='FECHA_INICIO_PROCESO', blank=True, null=True)  # Field name made lowercase.
    fecha_fin_proceso_estimada = models.DateField(db_column='FECHA_FIN_PROCESO_ESTIMADA', blank=True, null=True)  # Field name made lowercase.
    costo_base_constitucion = models.DecimalField(db_column='COSTO_BASE_CONSTITUCION', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    tipo_oferta = models.CharField(db_column='TIPO_OFERTA', max_length=255, blank=True, null=True)  # Field name made lowercase.
    fecha_caducidad_oferta = models.DateField(db_column='FECHA_CADUCIDAD_OFERTA', blank=True, null=True)  # Field name made lowercase.
    stock_oferta = models.IntegerField(db_column='STOCK_OFERTA', blank=True, null=True)  # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'EMPRESA'
        verbose_name = 'Empresa'
        verbose_name_plural = 'Empresas'

    def __str__(self):
        return f"{self.idpersona.nombres} - {self.rubro or 'Sin rubro'}"

class EmpresaSocio(models.Model):
    idempresa = models.OneToOneField(Empresa, models.DO_NOTHING, db_column='IDEMPRESA', primary_key=True)  # Field name made lowercase. The composite primary key (IDEMPRESA, IDPERSONA) found, that is not supported. The first column is selected.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    aporte_capital = models.DecimalField(db_column='APORTE_CAPITAL', max_digits=10, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='IDTABLA DE TAB_TABLAS')  # Field name made lowercase.      
    class Meta:
        managed = False
        db_table = 'EMPRESA_SOCIO'
        verbose_name = 'Socio de Empresa'
        verbose_name_plural = 'Socios de Empresa'
        unique_together = (('idempresa', 'idpersona'),)

    def __str__(self):
        return f"{self.idpersona.nombre_completo()} en {self.idempresa}"

class Requisito(models.Model):
    idrequisito = models.AutoField(db_column='IDREQUISITO', primary_key=True)  # Field name made lowercase.
    nombre_requisito = models.CharField(db_column='NOMBRE_REQUISITO', unique=True, max_length=100)  # Field name made lowercase.
    tipo_requisito = models.CharField(db_column='TIPO_REQUISITO', max_length=50)  # Field name made lowercase.
    es_obligatorio = models.IntegerField(db_column='ES_OBLIGATORIO')  # Field name made lowercase.
    descripcion_requisito = models.TextField(db_column='DESCRIPCION_REQUISITO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'REQUISITO'
        verbose_name = 'Requisito'
        verbose_name_plural = 'Requisitos'

    def __str__(self):
        return self.nombre_requisito

class EmpresaRequisitoCumplido(models.Model):
    idempresa_requisito = models.AutoField(db_column='IDEMPRESA_REQUISITO', primary_key=True)  # Field name made lowercase.
    idempresa = models.ForeignKey(Empresa, models.DO_NOTHING, db_column='IDEMPRESA')  # Field name made lowercase.
    idrequisito = models.ForeignKey('Requisito', models.DO_NOTHING, db_column='IDREQUISITO')  # Field name made lowercase.
    fecha_cumplido = models.DateTimeField(db_column='FECHA_CUMPLIDO', blank=True, null=True)  # Field name made lowercase.
    valor_dato = models.TextField(db_column='VALOR_DATO', blank=True, null=True)  # Field name made lowercase.
    url_documento_adjunto = models.CharField(db_column='URL_DOCUMENTO_ADJUNTO', max_length=255, blank=True, null=True)  # Field name made lowercase.
    estado_cumplimiento = models.CharField(db_column='ESTADO_CUMPLIMIENTO', max_length=50)  # Field name made lowercase.
    observaciones = models.TextField(db_column='OBSERVACIONES', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'EMPRESA_REQUISITO_CUMPLIDO'
        verbose_name = 'Requisito Cumplido por Empresa'
        verbose_name_plural = 'Requisitos Cumplidos por Empresas'
        unique_together = (('idempresa', 'idrequisito'),)

    def __str__(self):
        return f"{self.idempresa} - {self.idrequisito}"

class ProcesoPaso(models.Model):
    idprocesopaso = models.AutoField(db_column='IDPROCESOPASO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=145, blank=True, null=True)  # Field name made lowercase.
    orden = models.IntegerField(db_column='ORDEN', blank=True, null=True)  # Field name made lowercase.
    descripcion = models.TextField(db_column='DESCRIPCION', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='IDTABLA DE TAB_TABLAS HEREDADO DE CATALOGO_TABLAS')  # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'PROCESO_PASO'
        verbose_name = 'Paso de Proceso'
        verbose_name_plural = 'Pasos de Proceso'
        ordering = ['orden']

    def __str__(self):
        return f"{self.orden}. {self.nombre}"

class HistorialEmpresaProceso(models.Model):
    idempresa = models.OneToOneField(Empresa, models.DO_NOTHING, db_column='IDEMPRESA', primary_key=True)  # Field name made lowercase. The composite primary key (IDEMPRESA, IDPROCESOPASO) found, that is not supported. The first column is selected.
    idprocesopaso = models.ForeignKey('ProcesoPaso', models.DO_NOTHING, db_column='IDPROCESOPASO')  # Field name made lowercase.
    fecha_completado = models.DateTimeField(db_column='FECHA_COMPLETADO', blank=True, null=True)  # Field name made lowercase.
    observaciones = models.TextField(db_column='OBSERVACIONES', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='IDTABLA DE TAB_TABLAS HEREDADO DE CATALOGO_TABLAS')  # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'HISTORIAL_EMPRESA_PROCESO'
        verbose_name = 'Historial de Proceso de Empresa'
        verbose_name_plural = 'Historiales de Procesos de Empresas'
        unique_together = (('idempresa', 'idprocesopaso'),)

    def __str__(self):
        return f"{self.idempresa} - {self.idprocesopaso}"

class Archivo(models.Model):
    idarchivo = models.AutoField(db_column='IDARCHIVO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=255, blank=True, null=True)  # Field name made lowercase.
    peso = models.FloatField(db_column='PESO', blank=True, null=True)  # Field name made lowercase.
    unidad = models.CharField(db_column='UNIDAD', max_length=2, blank=True, null=True)  # Field name made lowercase.
    formato = models.CharField(db_column='FORMATO', max_length=55, blank=True, null=True)  # Field name made lowercase.
    directorio = models.CharField(db_column='DIRECTORIO', max_length=255, blank=True, null=True)  # Field name made lowercase.
    nombre_encriptado = models.CharField(db_column='NOMBRE_ENCRIPTADO', max_length=255, blank=True, null=True)  # Field name made lowercase.
    usuario_creacion = models.IntegerField(db_column='USUARIO_CREACION', blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    archivable_id = models.IntegerField(blank=True, null=True)
    archivable_type = models.CharField(max_length=255, blank=True, null=True)
    iddirectorio = models.ForeignKey('Directorio', models.DO_NOTHING, db_column='IDDIRECTORIO')  # Field name made lowercase.
    firma = models.BinaryField(db_column='FIRMA', blank=True, null=True)  # Field name made lowercase.
    clave_publica = models.TextField(db_column='CLAVE_PUBLICA', blank=True, null=True)  # Field name made lowercase.
    descripcion = models.TextField(db_column='DESCRIPCION', blank=True, null=True, db_comment='aqui agregamos el tipo de documento para mostrar como descripcion del archivo')  # Field name made lowercase.
    requiere_firma_digital = models.IntegerField(db_column='REQUIERE_FIRMA_DIGITAL', blank=True, null=True, db_comment='IDTABLA DE TAB_TABLAS HEREDADO DE CATALOGO_TABLAS')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ARCHIVO'
        verbose_name = 'Archivo'
        verbose_name_plural = 'Archivos'

    def __str__(self):
        return self.nombre or f"Archivo {self.idarchivo}"

class ArchivoFirma(models.Model):
    idarchivo = models.ForeignKey(Archivo, models.DO_NOTHING, db_column='IDARCHIVO', primary_key=True)  # Field name made lowercase. The composite primary key (IDARCHIVO, IDPERSONA) found, that is not supported. The first column is selected.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    firma = models.BinaryField(db_column='FIRMA', blank=True, null=True, editable=True)  # Field name made lowercase.
    clave_publica = models.TextField(db_column='CLAVE_PUBLICA', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    fecha_firma = models.DateTimeField(db_column='FECHA_FIRMA', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ARCHIVO_FIRMA'
        verbose_name = 'Firma de Archivo'
        verbose_name_plural = 'Firmas de Archivos'
        unique_together = (('idarchivo', 'idpersona'),)

    def __str__(self):
        return f"Firma de {self.idpersona} en {self.idarchivo}"

class Directorio(models.Model):
    iddirectorio = models.AutoField(db_column='IDDIRECTORIO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=45, db_collation='latin1_swedish_ci', blank=True, null=True)  # Field name made lowercase.
    path = models.CharField(db_column='PATH', max_length=255, blank=True, null=True)  # Field name made lowercase.
    iddirectoriopadre = models.ForeignKey('self', models.DO_NOTHING, db_column='IDDIRECTORIOPADRE', blank=True, null=True)  # Field name made lowercase.
    nivel = models.IntegerField(db_column='NIVEL', blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'DIRECTORIO'
        verbose_name = 'Directorio'
        verbose_name_plural = 'Directorios'

    def __str__(self):
        return self.nombre or f"Directorio {self.iddirectorio}"

    def get_full_path(self):
        if self.iddirectoriopadre:
            return f"{self.iddirectoriopadre.get_full_path()}/{self.nombre}"
        return self.nombre or ""