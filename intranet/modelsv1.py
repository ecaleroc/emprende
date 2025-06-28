# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Acceso(models.Model):
    idrol = models.OneToOneField('Rol', models.DO_NOTHING, db_column='IDROL', primary_key=True)  # Field name made lowercase. The composite primary key (IDROL, IDOBJACCESO) found, that is not supported. The first column is selected.
    idobjacceso = models.ForeignKey('Objacceso', models.DO_NOTHING, db_column='IDOBJACCESO')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='A:ACTIVO/I:INACTIVO/P:PENDIENTE/')  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ACCESO'
        unique_together = (('idrol', 'idobjacceso'),)


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

    class Meta:
        managed = False
        db_table = 'ARCHIVO'


class AreaServicio(models.Model):
    idareaservicio = models.AutoField(db_column='IDAREASERVICIO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=150, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True, db_comment='A:ACTIVO/I:INACTIVO/P:PENDIENTE')  # Field name made lowercase.
    url = models.CharField(db_column='URL', max_length=150, blank=True, null=True)  # Field name made lowercase.
    icono = models.CharField(db_column='ICONO', max_length=150, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'AREA_SERVICIO'


class CatalogoPlato(models.Model):
    idcatalogo_plato = models.AutoField(db_column='IDCATALOGO_PLATO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=145, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=345, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True)  # Field name made lowercase.
    idempresa = models.IntegerField(db_column='IDEMPRESA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CATALOGO_PLATO'


class CatalogoTablas(models.Model):
    idcatalogotablas = models.AutoField(db_column='IDCATALOGOTABLAS', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=245, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='A: Activo\nI: Inactivo')  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    abreviatura = models.CharField(db_column='ABREVIATURA', max_length=10, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CATALOGO_TABLAS'


class CatServicio(models.Model):
    idcatservicio = models.AutoField(db_column='IDCATSERVICIO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=150, blank=True, null=True)  # Field name made lowercase.
    idareaservicio = models.ForeignKey(AreaServicio, models.DO_NOTHING, db_column='IDAREASERVICIO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CAT_SERVICIO'


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


class Componente(models.Model):
    idcomponente = models.AutoField(db_column='IDCOMPONENTE', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=255, blank=True, null=True, db_comment='CABECERA/BANNER/CUERPO/PIE')  # Field name made lowercase.
    titulo = models.CharField(db_column='TITULO', max_length=255, blank=True, null=True)  # Field name made lowercase.
    resumen = models.TextField(db_column='RESUMEN', blank=True, null=True)  # Field name made lowercase.
    contenido = models.TextField(db_column='CONTENIDO', blank=True, null=True)  # Field name made lowercase.
    idcomponentepadre = models.ForeignKey('self', models.DO_NOTHING, db_column='IDCOMPONENTEPADRE', blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    idusuariocreacion = models.IntegerField(db_column='IDUSUARIOCREACION', blank=True, null=True)  # Field name made lowercase.
    fecha_actualizacion = models.DateTimeField(db_column='FECHA_ACTUALIZACION', blank=True, null=True)  # Field name made lowercase.
    idusuarioactualizacion = models.IntegerField(db_column='IDUSUARIOACTUALIZACION', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='PUBLICADO/VISTAPREVIA/NO PUBLICADO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'COMPONENTE'


class Conversacion(models.Model):
    idconversacion = models.AutoField(db_column='IDCONVERSACION', primary_key=True)  # Field name made lowercase.
    mensaje = models.TextField(db_column='MENSAJE', blank=True, null=True)  # Field name made lowercase.
    respuesta = models.TextField(db_column='RESPUESTA', blank=True, null=True)  # Field name made lowercase.
    fecha = models.DateTimeField(db_column='FECHA', blank=True, null=True)  # Field name made lowercase.
    idusuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='IDUSUARIO')  # Field name made lowercase.
    estado_lectura = models.IntegerField(db_column='ESTADO_LECTURA', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CONVERSACION'


class Cotizacion(models.Model):
    idcotizacion = models.AutoField(db_column='IDCOTIZACION', primary_key=True)  # Field name made lowercase.
    monto = models.CharField(db_column='MONTO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=545, blank=True, null=True)  # Field name made lowercase.
    idempresa = models.ForeignKey('Empresa', models.DO_NOTHING, db_column='IDEMPRESA')  # Field name made lowercase.
    idinsumo = models.ForeignKey('Insumo', models.DO_NOTHING, db_column='IDINSUMO')  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=2, blank=True, null=True, db_comment='COTIZADO\nPEDIDO\n')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'COTIZACION'


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


class Detalle(models.Model):
    idplato = models.OneToOneField('Plato', models.DO_NOTHING, db_column='IDPLATO', primary_key=True)  # Field name made lowercase. The composite primary key (IDPLATO, IDPEDIDO) found, that is not supported. The first column is selected.
    idpedido = models.ForeignKey('Pedido', models.DO_NOTHING, db_column='IDPEDIDO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DETALLE'
        unique_together = (('idplato', 'idpedido'),)


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


class Docadjunto(models.Model):
    iddocadjunto = models.AutoField(db_column='IDDOCADJUNTO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=345, blank=True, null=True)  # Field name made lowercase.
    urladjunto = models.CharField(db_column='URLADJUNTO', max_length=745, blank=True, null=True)  # Field name made lowercase.
    tamanio = models.FloatField(db_column='TAMANIO', blank=True, null=True)  # Field name made lowercase.
    formato = models.CharField(db_column='FORMATO', max_length=85, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DOCADJUNTO'


class Empresa(models.Model):
    idempresa = models.AutoField(db_column='IDEMPRESA', primary_key=True)  # Field name made lowercase.
    rubro = models.CharField(db_column='RUBRO', max_length=145, blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=445, blank=True, null=True)  # Field name made lowercase.
    tipo_comercio = models.IntegerField(db_column='TIPO_COMERCIO', blank=True, null=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'EMPRESA'


class EstacionTrabajo(models.Model):
    idestaciontrabajo = models.AutoField(db_column='IDESTACIONTRABAJO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=45, blank=True, null=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    observacion = models.CharField(db_column='OBSERVACION', max_length=45, blank=True, null=True)  # Field name made lowercase.
    idunidadorganica = models.ForeignKey('UnidadOrganica', models.DO_NOTHING, db_column='IDUNIDADORGANICA')  # Field name made lowercase.
    idpersonal = models.ForeignKey('Personal', models.DO_NOTHING, db_column='IDPERSONAL')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ESTACION_TRABAJO'


class Hisclaves(models.Model):
    idhisclave = models.AutoField(db_column='IDHISCLAVE', primary_key=True)  # Field name made lowercase.
    hashclave = models.CharField(db_column='HASHCLAVE', max_length=32, blank=True, null=True)  # Field name made lowercase.
    idusuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='IDUSUARIO')  # Field name made lowercase.
    syscreacion = models.DateTimeField(db_column='SYSCREACION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'HISCLAVES'


class Historiaclinica(models.Model):
    idhistoriaclinica = models.AutoField(db_column='IDHISTORIACLINICA', primary_key=True)  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    fecharegistro = models.DateTimeField(db_column='FECHAREGISTRO', blank=True, null=True)  # Field name made lowercase.
    tipo_sangre = models.CharField(db_column='TIPO_SANGRE', max_length=4, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'HISTORIACLINICA'


class Insumo(models.Model):
    idinsumo = models.AutoField(db_column='IDINSUMO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=245, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=445, blank=True, null=True)  # Field name made lowercase.
    cantidad = models.DecimalField(db_column='CANTIDAD', max_digits=2, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    unidad = models.CharField(db_column='UNIDAD', max_length=45, blank=True, null=True, db_comment='KG, SACO, CAJAS, ETC')  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True)  # Field name made lowercase.
    idempresa = models.ForeignKey(Empresa, models.DO_NOTHING, db_column='IDEMPRESA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'INSUMO'


class Local(models.Model):
    idlocal = models.AutoField(db_column='IDLOCAL', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=45, blank=True, null=True)  # Field name made lowercase.
    idempresa = models.ForeignKey(Empresa, models.DO_NOTHING, db_column='IDEMPRESA')  # Field name made lowercase.
    iddireccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='IDDIRECCION')  # Field name made lowercase.
    tipo_local = models.CharField(db_column='TIPO_LOCAL', max_length=145, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'LOCAL'


class Login(models.Model):
    idlogin = models.AutoField(db_column='IDLOGIN', primary_key=True)  # Field name made lowercase.
    access_token = models.TextField(db_column='ACCESS_TOKEN', blank=True, null=True)  # Field name made lowercase.
    expires_in = models.IntegerField(db_column='EXPIRES_IN', blank=True, null=True)  # Field name made lowercase.
    iat_in = models.IntegerField(db_column='IAT_IN', blank=True, null=True, db_comment='TIEMPO DE INICIO DE LOGIN')  # Field name made lowercase.
    token_type = models.CharField(db_column='TOKEN_TYPE', max_length=8, blank=True, null=True)  # Field name made lowercase.
    scope = models.CharField(db_column='SCOPE', max_length=45, blank=True, null=True)  # Field name made lowercase.
    refresh_token = models.TextField(db_column='REFRESH_TOKEN', blank=True, null=True)  # Field name made lowercase.
    fecha_ingreso = models.DateTimeField(db_column='FECHA_INGRESO', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    tipo_acceso = models.CharField(db_column='TIPO_ACCESO', max_length=45, blank=True, null=True, db_comment='FACEBOOK\nGOOGLE\nNORMAL')  # Field name made lowercase.
    idusuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='IDUSUARIO')  # Field name made lowercase.
    nro_ingresos = models.IntegerField(db_column='NRO_INGRESOS', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'LOGIN'


class LogConexion(models.Model):
    idlogconexion = models.AutoField(db_column='IDLOGCONEXION', primary_key=True)  # Field name made lowercase.
    uuid = models.CharField(db_column='UUID', max_length=500, blank=True, null=True)  # Field name made lowercase.
    info = models.CharField(db_column='INFO', max_length=800, blank=True, null=True)  # Field name made lowercase.
    bateria = models.CharField(db_column='BATERIA', max_length=500, blank=True, null=True)  # Field name made lowercase.
    idusuario = models.IntegerField(db_column='IDUSUARIO', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    fecha_conexion = models.DateTimeField(db_column='FECHA_CONEXION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'LOG_CONEXION'


class Medicamento(models.Model):
    idmedicamento = models.AutoField(db_column='IDMEDICAMENTO', primary_key=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=10, blank=True, null=True)  # Field name made lowercase.
    anemia_ninos = models.CharField(db_column='ANEMIA_NINOS', max_length=1, blank=True, null=True, db_comment='S:HABILITAR/N:NO HABILITAR')  # Field name made lowercase.
    anemia_gestante = models.CharField(db_column='ANEMIA_GESTANTE', max_length=1, blank=True, null=True, db_comment='S:HABILITAR/N:NO HABILITAR')  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=255, blank=True, null=True)  # Field name made lowercase.
    concentracion = models.CharField(db_column='CONCENTRACION', max_length=255, blank=True, null=True)  # Field name made lowercase.
    forma_farm = models.CharField(db_column='FORMA_FARM', max_length=150, blank=True, null=True)  # Field name made lowercase.
    forma_farm_simplificada = models.CharField(db_column='FORMA_FARM_SIMPLIFICADA', max_length=150, blank=True, null=True)  # Field name made lowercase.
    presentacion = models.CharField(db_column='PRESENTACION', max_length=255, blank=True, null=True)  # Field name made lowercase.
    ingredientes_activos = models.CharField(db_column='INGREDIENTES_ACTIVOS', max_length=4900, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'MEDICAMENTO'


class Menu(models.Model):
    idmenu = models.AutoField(db_column='IDMENU', primary_key=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=15, blank=True, null=True, db_comment=' EJEMPLO 001.00.000:Sistema, 001.01.000:M¾dulo, 001.01.001:Opci¾n,')  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=445, blank=True, null=True)  # Field name made lowercase.
    url = models.CharField(db_column='URL', max_length=150, blank=True, null=True)  # Field name made lowercase.
    icono = models.CharField(db_column='ICONO', max_length=150, blank=True, null=True)  # Field name made lowercase.
    fechacreacion = models.DateTimeField(db_column='FECHACREACION', blank=True, null=True)  # Field name made lowercase.
    fechaactualizacion = models.DateTimeField(db_column='FECHAACTUALIZACION', blank=True, null=True)  # Field name made lowercase.
    funcion = models.CharField(db_column='FUNCION', max_length=255, blank=True, null=True)  # Field name made lowercase.
    idobjacceso = models.ForeignKey('Objacceso', models.DO_NOTHING, db_column='IDOBJACCESO', blank=True, null=True)  # Field name made lowercase.
    nroparametros = models.IntegerField(db_column='NROPARAMETROS', blank=True, null=True)  # Field name made lowercase.
    route = models.CharField(db_column='ROUTE', max_length=20, blank=True, null=True, db_comment='GET, POST, PUT, DELETE,  OPTIONS, PATCH, Any, Custom')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='P:Pendiente/A:Activo/I:Inactivo/B:Baja')  # Field name made lowercase.
    middleware = models.IntegerField(db_column='MIDDLEWARE', blank=True, null=True, db_comment='Libre/Login')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'MENU'


class Modulos(models.Model):
    idmodulo = models.AutoField(db_column='IDMODULO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=150, blank=True, null=True)  # Field name made lowercase.
    nombre_corto = models.CharField(db_column='NOMBRE_CORTO', max_length=50, blank=True, null=True)  # Field name made lowercase.
    ruta = models.CharField(db_column='RUTA', max_length=255, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'MODULOS'


class Objacceso(models.Model):
    idobjacceso = models.AutoField(db_column='IDOBJACCESO', primary_key=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=50, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=150, blank=True, null=True)  # Field name made lowercase.
    idmodulo = models.ForeignKey(Modulos, models.DO_NOTHING, db_column='IDMODULO')  # Field name made lowercase.
    ruta = models.CharField(db_column='RUTA', max_length=255, blank=True, null=True)  # Field name made lowercase.
    controlador = models.CharField(db_column='CONTROLADOR', max_length=255, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    middleware = models.IntegerField(db_column='MIDDLEWARE', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'OBJACCESO'


class Opinion(models.Model):
    idopinion = models.IntegerField(db_column='IDOPINION', primary_key=True)  # Field name made lowercase.
    tipo = models.CharField(db_column='TIPO', max_length=1, blank=True, null=True, db_comment='RECLAMO/SUGERENCIA/COMENTARIO')  # Field name made lowercase.
    titulo = models.CharField(db_column='TITULO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=445, blank=True, null=True)  # Field name made lowercase.
    valoracion = models.DecimalField(db_column='VALORACION', max_digits=2, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True)  # Field name made lowercase.
    idusuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='IDUSUARIO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'OPINION'


class Pagina(models.Model):
    idpagina = models.AutoField(db_column='IDPAGINA', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=245, blank=True, null=True)  # Field name made lowercase.
    url = models.CharField(db_column='URL', max_length=645, blank=True, null=True)  # Field name made lowercase.
    titulo = models.TextField(db_column='TITULO', blank=True, null=True)  # Field name made lowercase.
    resumen = models.TextField(db_column='RESUMEN', blank=True, null=True)  # Field name made lowercase.
    contenido = models.TextField(db_column='CONTENIDO', blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    idusuariocreacion = models.IntegerField(db_column='IDUSUARIOCREACION', blank=True, null=True)  # Field name made lowercase.
    updated_at = models.DateTimeField(blank=True, null=True)
    idusuarioactualizacion = models.IntegerField(db_column='IDUSUARIOACTUALIZACION', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    idplantilla = models.ForeignKey('PlantillaWeb', models.DO_NOTHING, db_column='IDPLANTILLA')  # Field name made lowercase.
    idpaginapadre = models.ForeignKey('self', models.DO_NOTHING, db_column='IDPAGINAPADRE', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PAGINA'


class Pago(models.Model):
    idpago = models.AutoField(db_column='IDPAGO', primary_key=True)  # Field name made lowercase.
    fecha_pago = models.DateTimeField(db_column='FECHA_PAGO', blank=True, null=True)  # Field name made lowercase.
    monto = models.DecimalField(db_column='MONTO', max_digits=6, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    codigo_pago = models.CharField(db_column='CODIGO_PAGO', max_length=60, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True, db_comment='V:VERIFICACION/O:OK')  # Field name made lowercase.
    idpersona = models.ForeignKey('Persona', models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PAGO'


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


class Pedido(models.Model):
    idpedido = models.AutoField(db_column='IDPEDIDO', primary_key=True)  # Field name made lowercase.
    costo = models.DecimalField(db_column='COSTO', max_digits=5, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True)  # Field name made lowercase.
    total = models.DecimalField(db_column='TOTAL', max_digits=4, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    idcliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='IDCLIENTE')  # Field name made lowercase.
    idpersonal = models.ForeignKey('Personal', models.DO_NOTHING, db_column='IDPERSONAL')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PEDIDO'


class Permiso(models.Model):
    idusuario = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='IDUSUARIO', primary_key=True)  # Field name made lowercase. The composite primary key (IDUSUARIO, IDOBJACCESO) found, that is not supported. The first column is selected.
    idobjacceso = models.ForeignKey(Objacceso, models.DO_NOTHING, db_column='IDOBJACCESO')  # Field name made lowercase.
    tipo = models.CharField(db_column='TIPO', max_length=1, blank=True, null=True, db_comment='P:PERMITIDO/B:BLOQUEADO')  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True, db_comment='A:ACTIVO/I:INACTIVO')  # Field name made lowercase.
    syscreacion = models.DateTimeField(db_column='SYSCREACION', blank=True, null=True)  # Field name made lowercase.
    sysactualizacion = models.DateTimeField(db_column='SYSACTUALIZACION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PERMISO'
        unique_together = (('idusuario', 'idobjacceso'),)


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


class Personal(models.Model):
    idpersonal = models.AutoField(db_column='IDPERSONAL', primary_key=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=10, blank=True, null=True)  # Field name made lowercase.
    fecha_ingreso = models.DateField(db_column='FECHA_INGRESO', blank=True, null=True)  # Field name made lowercase.
    fecha_finalizacion = models.DateField(db_column='FECHA_FINALIZACION', blank=True, null=True)  # Field name made lowercase.
    idunidadorganica = models.ForeignKey('UnidadOrganica', models.DO_NOTHING, db_column='IDUNIDADORGANICA', blank=True, null=True)  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    idempresa = models.ForeignKey(Empresa, models.DO_NOTHING, db_column='IDEMPRESA')  # Field name made lowercase.
    nrolicencia = models.CharField(db_column='NROLICENCIA', max_length=11, blank=True, null=True)  # Field name made lowercase.
    catlicencia = models.CharField(db_column='CATLICENCIA', max_length=11, blank=True, null=True)  # Field name made lowercase.
    fecha_emision_licencia = models.DateField(db_column='FECHA_EMISION_LICENCIA', blank=True, null=True)  # Field name made lowercase.
    fecha_caducidad_licencia = models.DateField(db_column='FECHA_CADUCIDAD_LICENCIA', blank=True, null=True)  # Field name made lowercase.
    foto = models.IntegerField(db_column='FOTO', blank=True, null=True, db_comment='EXTRAE TABLA DOCADJUNTO')  # Field name made lowercase.
    cargo = models.IntegerField(db_column='CARGO', blank=True, null=True, db_comment='Lista de cargos: IDCATALOGOTABLAS=35')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='19: ACTIVO / 20: INACTIVO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PERSONAL'


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


class PersonaDireccion(models.Model):
    idpersona = models.OneToOneField(Persona, models.DO_NOTHING, db_column='IDPERSONA', primary_key=True)  # Field name made lowercase. The composite primary key (IDPERSONA, IDDIRECCION) found, that is not supported. The first column is selected.
    iddireccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='IDDIRECCION')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    estado_principal = models.IntegerField(db_column='ESTADO_PRINCIPAL', blank=True, null=True, db_comment='0: NORMAL 1: PRINCIPAL')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PERSONA_DIRECCION'
        unique_together = (('idpersona', 'iddireccion'),)


class PlantillaComponente(models.Model):
    idplantilla = models.OneToOneField('PlantillaWeb', models.DO_NOTHING, db_column='IDPLANTILLA', primary_key=True)  # Field name made lowercase. The composite primary key (IDPLANTILLA, IDCOMPONENTE) found, that is not supported. The first column is selected.
    idcomponente = models.ForeignKey(Componente, models.DO_NOTHING, db_column='IDCOMPONENTE')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    orden = models.IntegerField(db_column='ORDEN', blank=True, null=True, db_comment='VA EL ORDEN DE LOS COMPONENETES EN LA PLANTILLA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PLANTILLA_COMPONENTE'
        unique_together = (('idplantilla', 'idcomponente'),)


class PlantillaWeb(models.Model):
    idplantilla = models.AutoField(db_column='IDPLANTILLA', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=255, db_comment='nombre del template el cual se convertira en un componente de angular')  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PLANTILLA_WEB'


class Plato(models.Model):
    idplato = models.AutoField(db_column='IDPLATO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=145, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=545, blank=True, null=True)  # Field name made lowercase.
    precio = models.CharField(db_column='PRECIO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    valoracion = models.DecimalField(db_column='VALORACION', max_digits=2, decimal_places=0, blank=True, null=True)  # Field name made lowercase.
    tiempo_preparacion = models.TimeField(db_column='TIEMPO_PREPARACION', blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    fecha_actualizacion = models.DateTimeField(db_column='FECHA_ACTUALIZACION', blank=True, null=True)  # Field name made lowercase.
    idcatalogo_plato = models.ForeignKey(CatalogoPlato, models.DO_NOTHING, db_column='IDCATALOGO_PLATO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PLATO'


class Proveedor(models.Model):
    idproveedor = models.AutoField(db_column='IDPROVEEDOR', primary_key=True)  # Field name made lowercase.
    ruc = models.CharField(db_column='RUC', max_length=11, blank=True, null=True)  # Field name made lowercase.
    nombre_razonsocial = models.CharField(db_column='NOMBRE_RAZONSOCIAL', max_length=250, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PROVEEDOR'


class Provincia(models.Model):
    idprovincia = models.CharField(db_column='IDPROVINCIA', primary_key=True, max_length=6)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=145, blank=True, null=True)  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    iddepartamento = models.ForeignKey(Departamento, models.DO_NOTHING, db_column='IDDEPARTAMENTO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PROVINCIA'


class Rol(models.Model):
    idrol = models.AutoField(db_column='IDROL', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=150, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='AC:ACTIVO/IN:INACTIVO/BL:BLOQUEADO')  # Field name made lowercase.
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ROL'


class Sector(models.Model):
    idsector = models.AutoField(db_column='IDSECTOR', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=250, blank=True, null=True)  # Field name made lowercase.
    abreviatura = models.CharField(db_column='ABREVIATURA', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SECTOR'


class Seguro(models.Model):
    idseguro = models.AutoField(db_column='IDSEGURO', primary_key=True)  # Field name made lowercase.
    tipo_seguro = models.CharField(db_column='TIPO_SEGURO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    cobertura = models.FloatField(db_column='COBERTURA', blank=True, null=True)  # Field name made lowercase.
    monto = models.FloatField(db_column='MONTO', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SEGURO'


class Servicio(models.Model):
    idservicio = models.AutoField(db_column='IDSERVICIO', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=150, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=250, blank=True, null=True)  # Field name made lowercase.
    idcatservicio = models.ForeignKey(CatServicio, models.DO_NOTHING, db_column='IDCATSERVICIO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SERVICIO'


class ServicioPago(models.Model):
    idservicio = models.OneToOneField(Servicio, models.DO_NOTHING, db_column='IDSERVICIO', primary_key=True)  # Field name made lowercase. The composite primary key (IDSERVICIO, IDPAGO) found, that is not supported. The first column is selected.
    idpago = models.ForeignKey(Pago, models.DO_NOTHING, db_column='IDPAGO')  # Field name made lowercase.
    entrega_servicio = models.CharField(db_column='ENTREGA_SERVICIO', max_length=1, blank=True, null=True, db_comment='P:PENDIENTE/E:ENTREGADO')  # Field name made lowercase.
    cantidad = models.IntegerField(db_column='CANTIDAD', blank=True, null=True, db_comment='Si son varias, pago x varias personas, entradas, etc')  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=150, blank=True, null=True, db_comment='Detalle del tipo de pago oa ctividad')  # Field name made lowercase.
    observacion = models.CharField(db_column='OBSERVACION', max_length=150, blank=True, null=True)  # Field name made lowercase.
    valor_unitario = models.DecimalField(db_column='VALOR_UNITARIO', max_digits=7, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    subtotal = models.DecimalField(db_column='SUBTOTAL', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    prodasociado_id = models.IntegerField(db_column='PRODASOCIADO_ID', blank=True, null=True, db_comment='ID de ta bla asociada, ejemplo: cancha sera ID ACTIVIDAD_ESPACIO')  # Field name made lowercase.
    prodasociado_tipo = models.CharField(db_column='PRODASOCIADO_TIPO', max_length=50, blank=True, null=True, db_comment='Es la tabla asociada, ejemplo: para cancha ACTIVIDAD_ESPACIO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SERVICIO_PAGO'
        unique_together = (('idservicio', 'idpago'),)


class Sistema(models.Model):
    idsistema = models.AutoField(db_column='IDSISTEMA', primary_key=True)  # Field name made lowercase.
    tipo_sistema = models.CharField(db_column='TIPO_SISTEMA', max_length=2, blank=True, null=True, db_comment='WB:WEB/CS:CLIENTE SERVIDOR')  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=250, blank=True, null=True)  # Field name made lowercase.
    nombre_corto = models.CharField(db_column='NOMBRE_CORTO', max_length=50, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='19: ACTIVO/ 20: INACTIVO')  # Field name made lowercase.
    ruta = models.CharField(db_column='RUTA', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SISTEMA'


class SistemaModulos(models.Model):
    idsistema = models.OneToOneField(Sistema, models.DO_NOTHING, db_column='IDSISTEMA', primary_key=True)  # Field name made lowercase. The composite primary key (IDSISTEMA, IDMODULO) found, that is not supported. The first column is selected.
    idmodulo = models.ForeignKey(Modulos, models.DO_NOTHING, db_column='IDMODULO')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SISTEMA_MODULOS'
        unique_together = (('idsistema', 'idmodulo'),)


class TabTablas(models.Model):
    idtabla = models.AutoField(db_column='IDTABLA', primary_key=True)  # Field name made lowercase.
    idcatalogotablas = models.ForeignKey(CatalogoTablas, models.DO_NOTHING, db_column='IDCATALOGOTABLAS')  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=10, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=150, blank=True, null=True)  # Field name made lowercase.
    estado = models.PositiveIntegerField(db_column='ESTADO', db_comment='A:Activo/I:Inactivo')  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    fecha_actualizacion = models.DateTimeField(db_column='FECHA_ACTUALIZACION', blank=True, null=True)  # Field name made lowercase.
    cod_element1 = models.CharField(db_column='COD_ELEMENT1', max_length=6, blank=True, null=True)  # Field name made lowercase.
    cod_elem1_tipo = models.CharField(db_column='COD_ELEM1_TIPO', max_length=10, blank=True, null=True)  # Field name made lowercase.
    referencia1 = models.CharField(db_column='REFERENCIA1', max_length=50, blank=True, null=True)  # Field name made lowercase.
    referencia2 = models.CharField(db_column='REFERENCIA2', max_length=50, blank=True, null=True)  # Field name made lowercase.
    referencia3 = models.CharField(db_column='REFERENCIA3', max_length=50, blank=True, null=True)  # Field name made lowercase.
    valdat_lon_min = models.IntegerField(db_column='VALDAT_LON_MIN', blank=True, null=True)  # Field name made lowercase.
    valdat_lon_max = models.IntegerField(db_column='VALDAT_LON_MAX', blank=True, null=True)  # Field name made lowercase.
    valdat_tipo = models.CharField(db_column='VALDAT_TIPO', max_length=20, blank=True, null=True, db_comment='NUMERICO\nALFANUMERICO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'TAB_TABLAS'


class Ticket(models.Model):
    idticket = models.AutoField(db_column='IDTICKET', primary_key=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    fecha_hora_emision = models.DateTimeField(db_column='FECHA_HORA_EMISION', blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    prioridad = models.IntegerField(db_column='PRIORIDAD', blank=True, null=True)  # Field name made lowercase.
    tipo_atencion = models.IntegerField(db_column='TIPO_ATENCION', blank=True, null=True)  # Field name made lowercase.
    idcliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='IDCLIENTE')  # Field name made lowercase.
    idestaciontrabajo = models.ForeignKey(EstacionTrabajo, models.DO_NOTHING, db_column='IDESTACIONTRABAJO')  # Field name made lowercase.
    hora_inicio = models.DateTimeField(db_column='HORA_INICIO', blank=True, null=True)  # Field name made lowercase.
    hora_fin = models.DateTimeField(db_column='HORA_FIN', blank=True, null=True)  # Field name made lowercase.
    observaciones = models.CharField(db_column='OBSERVACIONES', max_length=245, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'TICKET'


class TipoContacto(models.Model):
    idtipocontacto = models.AutoField(db_column='IDTIPOCONTACTO', primary_key=True)  # Field name made lowercase.
    tipo = models.IntegerField(db_column='TIPO', blank=True, null=True, db_comment='TELEFONO/RADIO/CELULAR/CORREO')  # Field name made lowercase.
    numero = models.CharField(db_column='NUMERO', max_length=45, blank=True, null=True)  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    estado_principal = models.IntegerField(db_column='ESTADO_PRINCIPAL', blank=True, null=True)  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'TIPO_CONTACTO'


class UnidadEjecutora(models.Model):
    idunidadejecutora = models.AutoField(db_column='IDUNIDADEJECUTORA', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=150, blank=True, null=True)  # Field name made lowercase.
    abreviatura = models.CharField(db_column='ABREVIATURA', max_length=250, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True, db_comment='A:ACTIVO/I:INACTIVO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'UNIDAD_EJECUTORA'


class UnidadOrganica(models.Model):
    idunidadorganica = models.AutoField(db_column='IDUNIDADORGANICA', primary_key=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='CODIGO', max_length=10, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=100, blank=True, null=True)  # Field name made lowercase.
    nombre_corto = models.CharField(db_column='NOMBRE_CORTO', max_length=50, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=250, blank=True, null=True)  # Field name made lowercase.
    direccion = models.CharField(db_column='DIRECCION', max_length=150, blank=True, null=True)  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=1, blank=True, null=True, db_comment='P:PENDIENT/A:ACTIVO/I:INACTIVO/B:BAJA')  # Field name made lowercase.
    tipo = models.CharField(db_column='TIPO', max_length=2, blank=True, null=True, db_comment='UO:ES UNIDAD ORGANICA/OP:ES OPD\n')  # Field name made lowercase.
    idempresa = models.ForeignKey(Empresa, models.DO_NOTHING, db_column='IDEMPRESA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'UNIDAD_ORGANICA'


class UnidadOrganicaDependencia(models.Model):
    idunidadorganica = models.OneToOneField(UnidadOrganica, models.DO_NOTHING, db_column='IDUNIDADORGANICA', primary_key=True)  # Field name made lowercase. The composite primary key (IDUNIDADORGANICA, IDUNIDADORGANICADEPENDENCIA) found, that is not supported. The first column is selected.
    idunidadorganicadependencia = models.ForeignKey(UnidadOrganica, models.DO_NOTHING, db_column='IDUNIDADORGANICADEPENDENCIA', related_name='unidadorganicadependencia_idunidadorganicadependencia_set')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateTimeField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    fecha_fin = models.DateTimeField(db_column='FECHA_FIN', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'UNIDAD_ORGANICA_DEPENDENCIA'
        unique_together = (('idunidadorganica', 'idunidadorganicadependencia'),)


class Usuario(models.Model):
    idusuario = models.AutoField(db_column='IDUSUARIO', primary_key=True)  # Field name made lowercase.
    usuario = models.CharField(db_column='USUARIO', max_length=100, blank=True, null=True)  # Field name made lowercase.
    clave = models.CharField(db_column='CLAVE', max_length=250, blank=True, null=True)  # Field name made lowercase.
    updated_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='A:ACTIVO/I:INACTIVO/B:BLOQUEADO')  # Field name made lowercase.
    baja = models.IntegerField(db_column='BAJA', blank=True, null=True)  # Field name made lowercase.
    nrointentos = models.IntegerField(db_column='NROINTENTOS', blank=True, null=True)  # Field name made lowercase.
    alias = models.CharField(db_column='ALIAS', max_length=80, blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=150, blank=True, null=True)  # Field name made lowercase.
    idpersona = models.ForeignKey(Persona, models.DO_NOTHING, db_column='IDPERSONA')  # Field name made lowercase.
    idusuariocreacion = models.IntegerField(db_column='IDUSUARIOCREACION', blank=True, null=True)  # Field name made lowercase.
    ultima_conexion = models.DateTimeField(db_column='ULTIMA_CONEXION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'USUARIO'


class UsuarioRol(models.Model):
    idusuario = models.OneToOneField(Usuario, models.DO_NOTHING, db_column='IDUSUARIO', primary_key=True)  # Field name made lowercase. The composite primary key (IDUSUARIO, IDROL) found, that is not supported. The first column is selected.
    idrol = models.ForeignKey(Rol, models.DO_NOTHING, db_column='IDROL')  # Field name made lowercase.
    estado = models.IntegerField(db_column='ESTADO', blank=True, null=True, db_comment='A:ACTIVO/I:INACTIVO')  # Field name made lowercase.
    syscreacion = models.DateTimeField(db_column='SYSCREACION', blank=True, null=True)  # Field name made lowercase.
    sysactualizacion = models.DateTimeField(db_column='SYSACTUALIZACION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'USUARIO_ROL'
        unique_together = (('idusuario', 'idrol'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.IntegerField()
    group_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type_id = models.IntegerField(blank=True, null=True)
    user_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
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
