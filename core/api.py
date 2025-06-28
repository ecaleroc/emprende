from intranet.models import Login, Opinion, Usuario
from rest_framework import viewsets, permissions
from core.serializers2 import LoginSerializer, OpinionSerializer, UsuarioSerializer

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action # Para acciones personalizadas
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.filters import SearchFilter, OrderingFilter
#from django_filters.rest_framework import DjangoFilterBackend # pip install django-filter
from django.http import JsonResponse
import json
from django.http import HttpResponse
from django.core import serializers
class LoginViewSet(viewsets.ModelViewSet):
    queryset = Login.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = LoginSerializer
    @action(detail=False, methods=['get'], permission_classes=[permissions.AllowAny])
    def agotados(self, request):
        """
        Endpoint personalizado para listar productos con stock 0.
        Método: GET /productos/agotados/
        """
        agotados_productos = Login.getDatosSesion(1)
        usuario1 = Login.objects.filter(idusuario=1).select_related("idusuario").last()
        print(repr(usuario1.idlogin))
        #serializer = serializers.serialize('json', usuario1)
        serializer = LoginSerializer(usuario1)
        data = {"usuario": agotados_productos, "status": 200, "login": serializer.data }
        return Response(data)
        

class OpinionViewSet(viewsets.ModelViewSet):
    queryset = Opinion.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = OpinionSerializer

class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = UsuarioSerializer


#class OpinionViewSet(viewsets.ModelViewSet):
#    queryset = Opinion.objects.all()
#    serializer_class = OpinionSerializer
#    authentication_classes = [LoginTokenAuthentication]
#    permission_classes = [IsAuthenticated]

