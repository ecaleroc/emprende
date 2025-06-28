from rest_framework import serializers
from core.models.persona import Persona
from datetime import date

class PersonaSerializer(serializers.ModelSerializer):
    # Campos calculados y personalizados
    nombre_completo = serializers.SerializerMethodField()
    edad = serializers.SerializerMethodField()
    
    # Campos para choices (pueden ser definidos como enums o diccionarios)
    genero_display = serializers.SerializerMethodField()
    tipo_persona_display = serializers.SerializerMethodField()
    estado_display = serializers.SerializerMethodField()

    class Meta:
        model = Persona
        fields = [
            'idpersona',
            'tipodocumento',
            'nrodocumento',
            'nombres',
            'apellido_paterno',
            'apellido_materno',
            'nombre_completo',
            'foto',
            'fecha_nacimiento',
            'edad',
            'genero',
            'genero_display',
            'creador_registro',
            'systema',
            'tipo_persona',
            'tipo_persona_display',
            'estado',
            'estado_display',
            'created_at',
            'updated_at'
        ]
        read_only_fields = [
            'idpersona',
            'nombre_completo',
            'edad',
            'genero_display',
            'tipo_persona_display',
            'estado_display',
            'created_at',
            'updated_at'
        ]

    # --- Métodos para campos calculados ---
    def get_nombre_completo(self, obj):
        return obj.nombre_completo()

    def get_edad(self, obj):
        if obj.fecha_nacimiento:
            today = date.today()
            return today.year - obj.fecha_nacimiento.year - ((today.month, today.day) < (obj.fecha_nacimiento.month, obj.fecha_nacimiento.day))
        return None

    # --- Métodos para display de campos con choices ---
    def get_genero_display(self, obj):
        GENERO_CHOICES = {
            1: 'Masculino',
            2: 'Femenino',
            3: 'Otro'
        }
        return GENERO_CHOICES.get(obj.genero, 'Desconocido')

    def get_tipo_persona_display(self, obj):
        TIPO_PERSONA_CHOICES = {
            1: 'Natural',
            2: 'Jurídica'
        }
        return TIPO_PERSONA_CHOICES.get(obj.tipo_persona, 'Desconocido')

    def get_estado_display(self, obj):
        ESTADO_CHOICES = {
            1: 'Activo',
            2: 'No vivo',
            3: 'Restricción legal',
            4: 'Inactivo'
        }
        return ESTADO_CHOICES.get(obj.estado, 'Desconocido')

    # --- Validaciones personalizadas ---
    def validate_nrodocumento(self, value):
        if value and not value.isdigit():
            raise serializers.ValidationError("El número de documento debe contener solo dígitos.")
        return value

    def validate_fecha_nacimiento(self, value):
        if value and value > date.today():
            raise serializers.ValidationError("La fecha de nacimiento no puede ser futura.")
        return value