from rest_framework import serializers
from core.models.geografia import Pais, Departamento, Provincia, Distrito, Direccion

class PaisSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pais
        fields = ['id', 'iso', 'nombre', 'idioma', 'prefijo_tel']

class DepartamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Departamento
        fields = ['iddepartamento', 'nombre', 'codigo']

class ProvinciaSerializer(serializers.ModelSerializer):
    departamento = DepartamentoSerializer(source='iddepartamento', read_only=True)
    
    class Meta:
        model = Provincia
        fields = ['idprovincia', 'nombre', 'departamento']

class DistritoSerializer(serializers.ModelSerializer):
    provincia = ProvinciaSerializer(source='idprovincia', read_only=True)
    departamento = DepartamentoSerializer(source='iddepartamento', read_only=True)
    
    class Meta:
        model = Distrito
        fields = ['iddistrito', 'nombre', 'provincia', 'departamento']

class DireccionSerializer(serializers.ModelSerializer):
    distrito = DistritoSerializer(source='iddistrito', read_only=True)
    
    class Meta:
        model = Direccion
        fields = ['id', 'tipo', 'tipo_zona', 'nombre_zona', 'tipo_via', 'nomb_via', 
                 'tipo_exterior', 'valor_exterior', 'tipo_interior', 'valor_interior', 
                 'piso', 'latitud', 'longitud', 'distrito']
        extra_kwargs = {
            'iddistrito': {'write_only': True}
        }

class DireccionCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Direccion
        fields = ['tipo', 'tipo_zona', 'nombre_zona', 'tipo_via', 'nomb_via', 
                 'tipo_exterior', 'valor_exterior', 'tipo_interior', 'valor_interior', 
                 'piso', 'latitud', 'longitud', 'iddistrito']