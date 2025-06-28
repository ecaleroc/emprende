# core/backends.py
from django.contrib.auth.backends import BaseBackend
from intranet.models import Usuario

class UsuarioBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None):
        try:
            user = Usuario.objects.get(usuario=username)
            if user.check_password(password) and user.estado == 1:
                return user
        except Usuario.DoesNotExist:
            return None
    
    def get_user(self, user_id):
        try:
            return Usuario.objects.get(pk=user_id)
        except Usuario.DoesNotExist:
            return None