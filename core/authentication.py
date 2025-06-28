from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed
from intranet.models import Login

class LoginTokenAuthentication(BaseAuthentication):
    def authenticate(self, request):
        token = request.headers.get('Authorization')
        print(token)
        if token and token.startswith('Bearer '):
            token = token.split(' ')[1]
        else:
            token = request.COOKIES.get('access_token')

        if not token:
            raise AuthenticationFailed('Token no proporcionado.')

        try:
            login_entry = Login.objects.get(access_token=token, estado=1)
            return (login_entry.idusuario, None)
        except Login.DoesNotExist:
            raise AuthenticationFailed('Token inválido o expirado.')
