from rest_framework import serializers
from core.models.empresa import (
    Empresa, EmpresaSocio, Requisito, EmpresaRequisitoCumplido, 
    ProcesoPaso, HistorialEmpresaProceso, Archivo, ArchivoFirma
)
from core.models.persona import Persona
from core.serializers.persona import PersonaSerializer

class RequisitoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Requisito
        fields = ['id', 'nombre_requisito', 'tipo_requisito', 'es_obligatorio', 'descripcion_requisito']

class EmpresaRequisitoCumplidoSerializer(serializers.ModelSerializer):
    requisito = RequisitoSerializer(source='idrequisito', read_only=True)
    
    class Meta:
        model = EmpresaRequisitoCumplido
        fields = ['id', 'requisito', 'fecha_cumplido', 'valor_dato', 'url_documento_adjunto', 
                 'estado_cumplimiento', 'observaciones']

class ProcesoPasoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProcesoPaso
        fields = ['id', 'nombre', 'orden', 'descripcion', 'estado']

class HistorialEmpresaProcesoSerializer(serializers.ModelSerializer):
    proceso_paso = ProcesoPasoSerializer(source='idprocesopaso', read_only=True)
    
    class Meta:
        model = HistorialEmpresaProceso
        fields = ['id', 'proceso_paso', 'fecha_completado', 'observaciones', 'estado']

class EmpresaSocioSerializer(serializers.ModelSerializer):
    persona = PersonaSerializer(source='idpersona', read_only=True)
    
    class Meta:
        model = EmpresaSocio
        fields = ['id', 'persona', 'aporte_capital', 'estado']

class EmpresaSerializer(serializers.ModelSerializer):
    persona = PersonaSerializer(source='idpersona', read_only=True)
    socios = EmpresaSocioSerializer(source='empresasocio_set', many=True, read_only=True)
    requisitos = EmpresaRequisitoCumplidoSerializer(source='empresarequisitocumplido_set', many=True, read_only=True)
    historial_procesos = HistorialEmpresaProcesoSerializer(source='historialempresaproceso_set', many=True, read_only=True)
    
    class Meta:
        model = Empresa
        fields = ['id', 'rubro', 'descripcion', 'tipo_comercio', 'persona', 'tipo_empresa', 
                 'nro_socios', 'rango_capital', 'capital_monetario', 'actividad_negocio', 
                 'estado_constitucion', 'fecha_inicio_proceso', 'fecha_fin_proceso_estimada', 
                 'costo_base_constitucion', 'socios', 'requisitos', 'historial_procesos']

class EmpresaCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Empresa
        fields = ['rubro', 'descripcion', 'tipo_comercio', 'tipo_empresa', 'actividad_negocio']

class ArchivoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Archivo
        fields = ['id', 'nombre', 'peso', 'unidad', 'formato', 'descripcion', 'requiere_firma_digital']

class ArchivoFirmaSerializer(serializers.ModelSerializer):
    archivo = ArchivoSerializer(source='idarchivo', read_only=True)
    persona = PersonaSerializer(source='idpersona', read_only=True)
    
    class Meta:
        model = ArchivoFirma
        fields = ['id', 'archivo', 'persona', 'estado', 'fecha_firma']