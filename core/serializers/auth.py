from rest_framework import serializers
from core.models.auth import  Rol, UsuarioRol
from core.models.persona import Persona
from intranet.models import Usuario

class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona
        fields = ['id', 'nrodocumento', 'nombres', 'apellido_paterno', 'apellido_materno', 'foto', 'fecha_nacimiento', 'genero']

class RolSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rol
        fields = ['id', 'nombre', 'descripcion', 'estado']

class UsuarioRolSerializer(serializers.ModelSerializer):
    rol = RolSerializer(source='idrol', read_only=True)
    
    class Meta:
        model = UsuarioRol
        fields = ['id', 'rol', 'estado']

class UsuarioSerializer(serializers.ModelSerializer):
    persona = PersonaSerializer(source='idpersona', read_only=True)
    roles = UsuarioRolSerializer(source='usuariorol_set', many=True, read_only=True)
    
    class Meta:
        model = Usuario
        fields = ['id', 'usuario', 'estado', 'alias', 'descripcion', 'persona', 'roles']
        extra_kwargs = {
            'clave': {'write_only': True}
        }

class LoginSerializer(serializers.Serializer):
    usuario = serializers.CharField()
    clave = serializers.CharField(write_only=True)
    access_token = serializers.CharField(read_only=True)
    refresh_token = serializers.CharField(read_only=True)

    def validate(self, data):
        usuario = data.get('usuario')
        clave = data.get('clave')

        if usuario and clave:
            user = Usuario.objects.filter(usuario=usuario).first()
            if user and user.check_password(clave):
                if user.estado == 0:
                    raise serializers.ValidationError("Cuenta inactiva. Contacte al administrador.")
                if user.estado == 2:
                    raise serializers.ValidationError("Cuenta bloqueada. Contacte al administrador.")
                
                data['user'] = user
                return data
            raise serializers.ValidationError("Credenciales inválidas.")
        raise serializers.ValidationError("Debe proporcionar usuario y contraseña.")

class RegisterSerializer(serializers.ModelSerializer):
    clave = serializers.CharField(write_only=True, required=True, style={'input_type': 'password'})
    clave2 = serializers.CharField(write_only=True, required=True, style={'input_type': 'password'})
    
    # Campos de persona
    nrodocumento = serializers.CharField(write_only=True, required=True)
    nombres = serializers.CharField(write_only=True, required=True)
    apellido_paterno = serializers.CharField(write_only=True, required=True)
    apellido_materno = serializers.CharField(write_only=True, required=False)
    genero = serializers.IntegerField(write_only=True, required=False)
    fecha_nacimiento = serializers.DateField(write_only=True, required=False)

    class Meta:
        model = Usuario
        fields = ['usuario', 'clave', 'clave2', 'nrodocumento', 'nombres', 'apellido_paterno', 'apellido_materno', 'genero', 'fecha_nacimiento']

    def validate(self, attrs):
        if attrs['clave'] != attrs['clave2']:
            raise serializers.ValidationError({"clave": "Las contraseñas no coinciden."})
        
        if Usuario.objects.filter(usuario=attrs['usuario']).exists():
            raise serializers.ValidationError({"usuario": "Este correo ya está registrado."})
        
        if Persona.objects.filter(nrodocumento=attrs['nrodocumento']).exists():
            raise serializers.ValidationError({"nrodocumento": "Este número de documento ya está registrado."})
        
        return attrs

    def create(self, validated_data):
        # Crear persona primero
        persona_data = {
            'nrodocumento': validated_data['nrodocumento'],
            'nombres': validated_data['nombres'],
            'apellido_paterno': validated_data['apellido_paterno'],
            'apellido_materno': validated_data.get('apellido_materno'),
            'genero': validated_data.get('genero'),
            'fecha_nacimiento': validated_data.get('fecha_nacimiento'),
            'tipo_persona': 1,  # Natural
            'tipodocumento': 1,  # DNI por defecto
        }
        persona = Persona.objects.create(**persona_data)
        
        # Crear usuario
        user = Usuario(
            usuario=validated_data['usuario'],
            idpersona=persona,
            estado=1  # Activo
        )
        user.set_password(validated_data['clave'])
        user.save()
        
        # Asignar rol de cliente por defecto
        rol_cliente = Rol.objects.get_or_create(nombre='Cliente', defaults={
            'descripcion': 'Rol para clientes del sistema',
            'estado': 1
        })[0]
        
        UsuarioRol.objects.create(
            idusuario=user,
            idrol=rol_cliente,
            estado=1
        )
        
        return user