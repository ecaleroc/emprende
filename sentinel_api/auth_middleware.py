from django.utils.deprecation import MiddlewareMixin
from rest_framework.authentication import TokenAuthentication
from django.contrib.auth.models import AnonymousUser
from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed
from intranet.models import Login
from pprint import pprint
from django.http import JsonResponse

#from core.serializers2 import LoginSerializer
from core.authentication import LoginTokenAuthentication

from rest_framework.response import Response
class TokenAuthMiddleware(MiddlewareMixin):
    def process_request(self, request):
        print(request)
        #token = request.headers.get('Authorization')
        #token = request.headers.get('Authorization')
        #
        #if token and token.startswith('Bearer '):
        #    token = token.split(' ')[1]
        #else:
        #    token = request.COOKIES.get('access_token')
        #if not token:
        #    raise AuthenticationFailed('Token no proporcionado.')
        #
        #try:
        #    login_entry = Login.objects.filter(access_token=token, estado=1)
        #    serializer = LoginSerializer(login_entry, many=True)
        #    print("**********")
        #    print(serializer.data[0]["idusuario"])
        #    return (serializer.data[0]["idusuario"], None)
        #except Login.DoesNotExist:
        #    raise AuthenticationFailed('Token inválido o expirado.')

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