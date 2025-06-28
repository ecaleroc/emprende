from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from django.shortcuts import render,redirect

from intranet.models import Usuario, Opinion, Persona
from core.serializers2 import OpinionSerializer,ConversacionSerializer
from core.authentication import LoginTokenAuthentication

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from .dialogflow_client import enviar_a_dialogflow


from django.views.decorators.csrf import csrf_exempt
from intranet.models import Conversacion, Usuario  # Asegúrate que esté definida
import json
from .forms import OpinionForm

def opinion_view(request):
    if request.method == 'POST':
        form = OpinionForm(request.POST)
        correo = request.POST.get('correo')
        nombres = request.POST.get('nombres')
        usuario = Usuario.objects.filter(usuario=correo).first()

        if not usuario:
            # Crear usuario automáticamente si no existe
            persona = Persona.objects.create(nombres=nombres)
            usuario = Usuario.objects.create(idpersona=persona, usuario=correo)

        if form.is_valid():
            opinion = form.save(commit=False)
            opinion.idusuario = usuario
            opinion.estado = 'P'  # P = pendiente
            opinion.save()
            return render(request, 'form/opinion_gracias.html')
    else:
        form = OpinionForm()
    return render(request, 'form/opinion_form.html', {'form': form})

@csrf_exempt
def chat_api_view(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            mensaje = data.get('mensaje', '').strip()

            if not mensaje:
                return JsonResponse({'error': 'Mensaje vacío'}, status=400)

            respuesta = enviar_a_dialogflow(mensaje)
            Conversacion.objects.create(mensaje=mensaje, respuesta=respuesta)

            return JsonResponse({'respuesta': respuesta}, status=200)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)

#def chat_page_view(request):
#    historial = Conversacion.objects.order_by('-fecha')[:10]
#    return render(request, 'chat.html', {'historial': historial})
    
def index(request):
    return render(request, 'index.html')  # Renderiza la plantilla

@api_view(['GET', 'PUT', 'DELETE','OPTION'])
def api_login(request, pk):
    opinions = Opinion.objects.all()
    serializer = OpinionSerializer(opinions, many=True)
    return Response(serializer.data)

@api_view(['GET', 'POST'])
def opinion_list(request):
    """
    List all code opinions, or create a new opinion.
    """
    print("---------------------------->imprime la lista")
    opinions = Opinion.objects.all()
    serializer = OpinionSerializer(opinions, many=True)
    return Response(serializer.data)

@api_view(['GET', 'PUT', 'DELETE'])
def opinion_detail(request, pk):
    """
    Retrieve, update or delete a code opinion.
    """
    try:
        opinion = Opinion.objects.get(pk=pk)
    except Opinion.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = OpinionSerializer(opinion)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = OpinionSerializer(opinion, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        opinion.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)