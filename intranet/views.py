from rest_framework import viewsets
from .models import Opinion
from core.serializers2 import ConversacionSerializer
from rest_framework.permissions import IsAuthenticated
from django.core import serializers

from django.shortcuts import render,redirect, get_object_or_404
from django.contrib.auth.models import User
from django.contrib.auth import login,logout,authenticate

from django.utils import timezone
from rest_framework_simplejwt.tokens import RefreshToken
from .models import Usuario, Login, Persona, Conversacion, Opinion, TabTablas, Opinion, Cliente, PersonaContacto, PersonaDireccion, Archivo,Archivo
import hashlib
from pprint import pprint
from rest_framework.decorators import api_view, authentication_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework_simplejwt.tokens import AccessToken

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
import datetime
from .models import *
import os
from django.conf import settings

from core.dialogflow_client import obtener_respuesta_dialogflow
from django.db.models import Count, Max, Q
from rest_framework.views import APIView
from rest_framework.response import Response
from core.forms import PersonaForm, UsuarioForm

from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse, HttpResponseBadRequest
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding, rsa
from cryptography.exceptions import InvalidSignature
from cryptography.hazmat.primitives.serialization import load_pem_public_key
import uuid

import zipfile
import io
from django.http import HttpResponse

from PyPDF2 import PdfReader, PdfWriter
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from cryptography.hazmat.backends import default_backend

from django.http import FileResponse
from io import BytesIO
import os
from django.utils.timezone import localtime
from .models import Empresa
from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from .models import Empresa, EmpresaSocio
from core.forms import EmpresaSocioForm
import qrcode
from reportlab.lib.utils import ImageReader


def firmar_archivo_api(request):
    if request.method == 'POST':
        archivo_id = request.POST.get('archivo_id')
        socio_id = request.POST.get('socio_id')
        if ArchivoFirma.objects.filter(archivo_id=archivo_id, socio_id=socio_id).exists():
            return JsonResponse({'success': False, 'msg': 'Ya firmado'})
        ArchivoFirma.objects.create(archivo_id=archivo_id, socio_id=socio_id)
        return JsonResponse({'success': True})
    return JsonResponse({'success': False})
def archivos_empresa_modal(request, pk):
    empresa = get_object_or_404(Empresa, pk=pk)
    archivos = Archivo.objects.filter(archivable_id=pk, archivable_type='Empresa').order_by('-created_at')
    socios = EmpresaSocio.objects.filter(idempresa=pk).select_related('idpersona')
    firmas = ArchivoFirma.objects.filter(
        idarchivo__archivable_id=pk,
        idarchivo__archivable_type='Empresa'
    )
    firmas_set = set(f"{str(f.idarchivo_id)}-{str(f.idpersona_id)}" for f in firmas)
    return render(request, 'empresa/modal_archivos_firma.html', {
        'MEDIA_URL': settings.MEDIA_URL,
        'empresa': empresa,
        'archivos': archivos,
        'socios': socios,
        'firmas_set': firmas_set,
    })
def buscar_persona_por_documento(request):
    term = request.GET.get('term', '')
    personas = Persona.objects.filter(nrodocumento__icontains=term)[:10]
    results = [
        {
            'id': p.idpersona,
            'text': f"{p.nrodocumento} - {p.nombres} {p.apellido_paterno} {p.apellido_materno}"
        }
        for p in personas
    ]
    return JsonResponse({'results': results})
def agregar_socio_view(request, pk):
    empresa = get_object_or_404(Empresa, pk=pk)
    print("POST:", request.POST)
    if request.method == 'POST':
        form = EmpresaSocioForm(request.POST)
        if form.is_valid():
            socio = form.save(commit=False)
            socio.idempresa = empresa
            socio.save()
            return JsonResponse({'success': True})
        else:
            html = render(request, 'empresa/form_agregar_socio.html', {'form': form, 'empresa': empresa}).content.decode()
            return JsonResponse({'success': False, 'form_html': html})
    else:
        form = EmpresaSocioForm()
        return render(request, 'empresa/form_agregar_socio.html', {'form': form, 'empresa': empresa})

def firmar_pdf_multiple(request, archivo_id):
    try:
        archivo = get_object_or_404(Archivo, idarchivo=archivo_id)
        firmas = ArchivoFirma.objects.filter(idarchivo=archivo, firma__isnull=False)

        if archivo.formato.lower() != 'application/pdf':
            return HttpResponse("Solo se pueden firmar archivos PDF", status=400)

        path = os.path.join(settings.MEDIA_ROOT, archivo.directorio, archivo.nombre)
        if not os.path.exists(path):
            return HttpResponse("Archivo no encontrado", status=404)

        for firma in firmas:
            if not firma.firma or not firma.clave_publica:
                return HttpResponse("El archivo debe estar firmado primero", status=400)

        with open(path, "rb") as f:
            reader = PdfReader(f)
            writer = PdfWriter()

            for i, page in enumerate(reader.pages):
                packet = BytesIO()
                can = canvas.Canvas(packet, pagesize=letter)

                can.setFont("Helvetica-Bold", 8)

                # Posicionamiento de QRs en parte inferior
                x = 40
                y = 80  # margen inferior

                for idx, firma in enumerate(firmas):
                    nombre = f"{firma.idpersona.nombres} {firma.idpersona.apellido_paterno}"
                    fecha = firma.fecha_firma.strftime("%Y-%m-%d %H:%M") if firma.fecha_firma else "sin fecha"
                    hash_text = hashlib.sha256(firma.firma).hexdigest()
                    clave_compacta = (firma.clave_publica or "")[:240]

                    qr_data = f"""
Archivo: {archivo.nombre}
Firmante: {nombre}
Fecha: {fecha}
SHA256: {hash_text[:12]}...{hash_text[-12:]}
Clave: {clave_compacta}...
""".strip()

                    # Crear QR
                    qr_img = qrcode.make(qr_data)
                    qr_buffer = BytesIO()
                    qr_img.save(qr_buffer, format='PNG')
                    qr_buffer.seek(0)
                    qr_reader = ImageReader(qr_buffer)

                    # Dibujar QR
                    can.drawImage(qr_reader, x, y, width=80, height=80)
                    can.drawString(x, y - 10, f"Firma {idx+1}")

                    x += 100
                    if x > 450:
                        x = 40
                        y += 100  # sube si hay más filas

                can.save()
                packet.seek(0)
                overlay_page = PdfReader(packet).pages[0]
                page.merge_page(overlay_page)
                writer.add_page(page)

        output = BytesIO()
        writer.write(output)
        output.seek(0)

        filename = archivo.nombre.replace('.pdf', '_firmado_qr.pdf')
        return HttpResponse(output.read(), content_type="application/pdf", headers={
            'Content-Disposition': f'attachment; filename="{filename}"'
        })

    except Exception as e:
        return HttpResponse(f"Error al firmar PDF: {str(e)}", status=500)


def archivo_timeline(request):
    archivos = Archivo.objects.all().order_by('-created_at')
    firmas = ArchivoFirma.objects.select_related('idpersona', 'idarchivo')
    return render(request, 'form/form_empresa.html', {
        'archivos': archivos,
        'firmas': firmas,
    })
@csrf_exempt
def firmar_documento_persona(request):
    if request.method == 'POST':
        idarchivo = request.POST.get('archivo')
        idpersona = request.POST.get('persona')

        archivo = get_object_or_404(Archivo, pk=idarchivo)
        persona = get_object_or_404(Persona, pk=idpersona)

        ruta_archivo = os.path.join(settings.MEDIA_ROOT, archivo.directorio, archivo.nombre)
        ruta_clave_privada = os.path.join(settings.BASE_DIR, 'keys/clave_privada.pem')

        with open(ruta_clave_privada, 'rb') as key_file:
            private_key = serialization.load_pem_private_key(
                key_file.read(), password=None, backend=default_backend()
            )

        with open(ruta_archivo, 'rb') as f:
            contenido = f.read()

        firma = private_key.sign(
            contenido,
            padding.PSS(mgf=padding.MGF1(hashes.SHA256()), salt_length=padding.PSS.MAX_LENGTH),
            hashes.SHA256()
        )

        ArchivoFirma.objects.update_or_create(
            idarchivo=archivo,
            idpersona=persona,
            defaults={
                'firma': firma,
                'clave_publica': private_key.public_key().public_bytes(
                    encoding=serialization.Encoding.PEM,
                    format=serialization.PublicFormat.SubjectPublicKeyInfo
                ).decode('utf-8'),
                'fecha_firma': timezone.now(),
                'estado': 1
            }
        )

        return JsonResponse({'mensaje': 'Documento firmado por la persona correctamente.'})
def chat_admin_panel(request):
    return render(request, 'chat_admin.html')
@csrf_exempt
def get_users(request):
    usuarios = Usuario.objects.annotate(
        no_leidos=Count('conversacion', filter=Q(conversacion__estad_lectura=False)),
        ultima_fecha=Max('conversacion__fecha')
    ).filter(conversacion__isnull=False)

    data = []
    for u in usuarios:
        last = Conversacion.objects.filter(idusuario=u).latest('fecha')
        data.append({
            'id': u.idusuario,
            'correo': u.usuario,
            'last_message': last.mensaje or last.respuesta,
            'no_leidos': u.no_leidos,
            'fecha': last.fecha.strftime('%Y-%m-%d %H:%M')
        })
    return JsonResponse(data, safe=False)

@csrf_exempt
def listar_personas(request):
    personas = Persona.objects.all()
    empresas = Empresa.objects.all()

    return render(request, 'vistas/tabla_personas.html', {
        'personas': personas,
        'empresas': empresas
    })
@csrf_exempt
def tabla_empresas_usuarios(request):
    empresas = Empresa.objects.all().select_related()
    usuarios = Usuario.objects.select_related('idpersona')
    return render(request, 'vistas/tabla_empresas.html', {
        'empresas': empresas,
        'usuarios': usuarios,
    })
@csrf_exempt
def get_conversation(request, user_id):
    conv = Conversacion.objects.filter(idusuario_id=user_id).order_by('fecha')
        # Buscar si ya existe el usuario por su correo (usuario = correo)
    #usuario = eval(Usuario.objects.filter(idusuario=user_id).first())
   
    Conversacion.objects.filter(idusuario_id=user_id, estad_lectura=False).update(estad_lectura=True)
    historial = [
        {'mensaje': c.mensaje, 'respuesta': c.respuesta, 'fecha': c.fecha.strftime('%H:%M') } for c in conv
    ]
    return JsonResponse(historial, safe=False)

@csrf_exempt
def admin_reply(request, user_id):
    data = json.loads(request.body)
    respuesta = data.get('respuesta')
    Conversacion.objects.create(respuesta=respuesta, idusuario_id=user_id, estad_lectura=True)
    return JsonResponse({'ok': True})


# views.py
class ChatUsersView(APIView):
    def get(self, request):
        usuarios = Usuario.objects.annotate(
            no_leidos=Count('conversacion', filter=Q(conversacion__estad_lectura=False)),
            ultima_fecha=Max('conversacion__fecha')
        ).filter(conversacion__isnull=False)

        data = []
        for u in usuarios:
            last_msg = Conversacion.objects.filter(idusuario=u).latest('fecha')
            data.append({
                'idusuario': u.idusuario,
                'usuario': u.usuario,
                'no_leidos': u.no_leidos,
                'last_message': last_msg.mensaje or last_msg.respuesta,
                'fecha': last_msg.fecha.strftime('%Y-%m-%d %H:%M')
            })
        return Response(data)
class ChatHistoryView(APIView):
    def get(self, request, user_id):
        mensajes = Conversacion.objects.filter(idusuario_id=user_id).order_by('fecha')
        # Marcar como leídos
        mensajes.filter(estad_lectura=False).update(estad_lectura=True)
        return Response(ConversacionSerializer(mensajes, many=True).data)
class AdminReplyView(APIView):
    def post(self, request, user_id):
        resp = request.data.get('respuesta')
        c = Conversacion.objects.create(
            mensaje='', respuesta=resp, idusuario_id=user_id, leido=True
        )
        # opcional: emitir evento WebSocket
        return Response({'ok':True, 'respuesta': ConversacionSerializer(c).data})

def index(request):
    return render(request, 'usuario/login.html')  # Renderiza la plantilla

def chat_view(request):
    
    token = request.COOKIES.get('access_token')
    if not token:
        return redirect('../login/')
    try:
        # Verificar si existe en la tabla LOGIN
        login_entry = Login.objects.get(access_token=token)
        # Verificar si el token es válido
        AccessToken(token)  # lanza excepción si no es válido
        return render(request, 'chat.html', {'usuario': login_entry.idusuario})
    except Exception as e:
        return redirect('../login/')

def intranet_view(request):
    
    token = request.COOKIES.get('access_token')
    if not token:
        return redirect('../login/')
    try:
        # Verificar si existe en la tabla LOGIN
        login_entry = Login.objects.get(access_token=token)
        # Verificar si el token es válido
        AccessToken(token)  # lanza excepción si no es válido
        return render(request, 'intranet.html', {'usuario': login_entry.idusuario})
    except Exception as e:
        return redirect('../login/')

def crea_empresa_view(request):
    
    token = request.COOKIES.get('access_token')
    if not token:
        return redirect('../login/')
    try:
        # Verificar si existe en la tabla LOGIN
        login_entry = Login.objects.get(access_token=token)
        # Verificar si el token es válido
        AccessToken(token)  # lanza excepción si no es válido
        return render(request, 'crea-empresa.html', {'usuario': login_entry.idusuario})
    except Exception as e:
        return redirect('../login/')
def login_view(request):
    if request.method == 'POST':
        usuario_input = request.POST.get('usuario')
        clave_input = request.POST.get('clave')
        clavehash = hashlib.sha256(str(clave_input).encode('utf-8')).hexdigest()
        try:
            usuario = Usuario.objects.get(usuario=usuario_input)

            if usuario.clave == clavehash:  # ⚠️ Verifica si es texto plano
                # Creamos un token falso (ya que no es AbstractUser)
                class DummyUser:
                    def __init__(self, idusuario):
                        self.idusuario = idusuario
                    @property
                    def is_authenticated(self):
                        return True

                dummy_user = DummyUser(usuario.idusuario)
                refresh = RefreshToken.for_user(dummy_user)
                access = str(refresh.access_token)
                tokenType = str(refresh.token_type)
                exp = refresh.get("exp")
                iat = refresh.get("iat")
                # Guardar en la tabla LOGIN
                Login.objects.create(
                    idusuario=usuario,
                    access_token=access,
                    expires_in=exp,
                    iat_in=iat,
                    token_type=tokenType,
                    refresh_token=str(refresh),
                    fecha_ingreso=timezone.now(),
                    estado=1,
                    tipo_acceso='NORMAL',
                    nro_ingresos=Login.objects.filter(idusuario=usuario).count() + 1
                )
                usersito = Login.getDatosSesion(usuario.idusuario)
                print("******************")
                print(usersito)

                # Redirigir a la intranet con cookie
                response = redirect('/intranet/')
                response.set_cookie('access_token', access, httponly=True)
                response.set_cookie('usuario', usersito, httponly=True)
                return response

            else:
                return render(request, 'usuario/login.html', {'error': 'Clave incorrecta'})

        except Usuario.DoesNotExist:
            return render(request, 'usuario/login.html', {'error': 'Usuario no encontrado'})

    return render(request, 'usuario/login.html')

@csrf_exempt
def registro_usuario_view(request):
    tipo_persona_choices = TabTablas.objects.filter(idcatalogotablas=8)
    tipo_documento_choices = TabTablas.objects.filter(idcatalogotablas=1)

    if request.method == 'POST':
        persona_form = PersonaForm(request.POST)
        usuario_form = UsuarioForm(request.POST)
        if persona_form.is_valid() and usuario_form.is_valid():
            persona = persona_form.save()
            usuario = usuario_form.save(commit=False)
            usuario.idpersona = persona
            usuario.save()
            return redirect('login')
    else:
        persona_form = PersonaForm()
        usuario_form = UsuarioForm()

    return render(request, 'usuario/registro.html', {
        'persona_form': persona_form,
        'usuario_form': usuario_form,
        'tipo_persona_choices': tipo_persona_choices,
        'tipo_documento_choices': tipo_documento_choices,
    })

@csrf_exempt
def registro_empresa_view(request):
    
    tipo_persona_choices = TabTablas.objects.filter(idcatalogotablas=8)
    tipo_documento_choices = TabTablas.objects.filter(idcatalogotablas=1)
    departamentos = Departamento.objects.all()
    return render(request, 'form/form_empresa.html', {
        'departamentos': departamentos,
        'tipo_persona_choices': tipo_persona_choices,
        'tipo_documento_choices': tipo_documento_choices,
    })#registro de persona

@csrf_exempt
def obtener_o_registrar_persona(request):
    token = request.COOKIES.get('access_token')
    usuariocookie =  eval(request.COOKIES.get('usuario'))
    if not token:
        return redirect('../login/')
    try:
        # Verificar si existe en la tabla LOGIN
        print("--------------------------------:;aqui estoy please")
        print(usuariocookie)
    
        login_entry = Login.objects.get(access_token=token)
        print(login_entry)
        # Verificar si el token es válido
        AccessToken(token)  # lanza excepción si no es válido
        if request.method == 'POST':
            data = request.POST
            
            usuario_input = data.get('correo')
            from .models import Usuario
            usuario = Usuario.objects.filter(usuario=usuariocookie[0]["USUARIO"]).first()
            persona = usuario.idpersona if usuario else None
            if persona:
                return JsonResponse({
                    'usuario': usuariocookie[0]
                })
            else:
                persona = Persona.objects.create(
                    nombres=data.get('nombres'),
                    apellido_paterno=data.get('apellido_paterno')
                )
                PersonaContacto.objects.create(
                    idpersona=persona,
                    descripcion=usuario_input
                )
                #PersonaDireccion.objects.create(
                #    idpersona=persona,
                #    iddireccion=1
                #)
                return JsonResponse({
                    'persona_id': persona.idpersona,
                    'nombres': persona.nombres,
                    'apellido_paterno': persona.apellido_paterno,
                    'data': usuariocookie[0]
                })

    except Exception as e:
        return redirect('../login/')
    

@csrf_exempt
def registrar_persona(request):
    if request.method == 'POST':
        data = request.POST
        persona = Persona.objects.create(
            nombres=data['nombres'],
            apellidos=data['apellidos']
        )
        PersonaContacto.objects.create(
            idpersona=persona,
            correo=data.get('correo')
        )
        PersonaDireccion.objects.create(
            idpersona=persona,
            departamento=data.get('departamento'),
            provincia=data.get('provincia'),
            distrito=data.get('distrito')
        )
        return JsonResponse({'persona_id': persona.id})

@csrf_exempt
def registrar_empresa(request):
    if request.method == 'POST':
        data = request.POST
        persona_id = data['representante_id']
        empresa = Empresa.objects.create(
            nombre=data['nombre'],
            ruc=data['ruc'],
            representante_id=persona_id
        )
        Personal.objects.create(
            idpersona_id=persona_id,
            idempresa=empresa,
            cargo=data.get('cargo', 'Representante')
        )
        Direccion.objects.create(
            descripcion=data.get('direccion'),
            idempresa=empresa
        )
        return JsonResponse({'empresa_id': empresa.id})

# VISTAS AJAX PARA CARGA DINÁMICA (agregar en views.py)
@csrf_exempt
def get_provincias(request):
    if request.method == 'GET':
        departamento_id = request.GET.get('departamento_id')

        provincias = Provincia.objects.filter(iddepartamento=departamento_id).values('idprovincia', 'nombre')
        return JsonResponse(list(provincias), safe=False)

@csrf_exempt
def get_distritos(request):
    if request.method == 'GET':
        provincia_id = request.GET.get('provincia_id')
        distritos = Distrito.objects.filter(idprovincia=provincia_id).values('iddistrito', 'nombre')
        return JsonResponse(list(distritos), safe=False)
@csrf_exempt
def subir_archivo(request):
    
    if request.method != 'POST':
        return HttpResponseBadRequest("Método no permitido")

    archivo = request.FILES.get('archivo')
    if not archivo:
        return HttpResponseBadRequest("No se recibió ningún archivo")

    # Validar extensión
    if not archivo.name.lower().endswith('.pdf'):
        return HttpResponseBadRequest("Solo se permiten archivos con extensión .pdf")

    # Validar MIME
    if archivo.content_type != 'application/pdf':
        return HttpResponseBadRequest("El archivo no tiene tipo MIME válido para PDF")

    # Validar estructura real del PDF
    try:
        pdf = PdfReader(archivo)
        num_paginas = len(pdf.pages)  # intenta acceder a páginas para forzar lectura
    except Exception:
        return HttpResponseBadRequest("El archivo no es un PDF válido o está dañado")

    #archivo = request.FILES['archivo']
    idempresa=request.POST['idempresa']
    nombre = archivo.name
    extension = nombre.split('.')[-1]
    nombre_encriptado = str(uuid.uuid4()) + '.' + extension
    peso = archivo.size / 1024  # KB
    formato = archivo.content_type
    directorio = 'uploads/'
    directorio_instance = Directorio.objects.get(iddirectorio=1)
    ruta_destino = os.path.join(settings.MEDIA_ROOT, directorio, nombre)
    os.makedirs(os.path.dirname(ruta_destino), exist_ok=True)
    with open(ruta_destino, 'wb+') as f:
        for chunk in archivo.chunks():
            f.write(chunk)
    archivo_obj = Archivo.objects.create(
        nombre=nombre,
        peso=peso,
        unidad='KB',
        formato=formato,
        directorio=directorio,
        nombre_encriptado=nombre_encriptado,  # temporalmente igual
        usuario_creacion=request.user.id,
        archivable_id=idempresa,
        archivable_type='Empresa',
        descripcion=ruta_destino,
        iddirectorio=directorio_instance  # por defecto o asignación
    )
    return JsonResponse({
        'id': archivo_obj.idarchivo,
        'nombre': archivo_obj.nombre,
        'fecha': archivo_obj.created_at.strftime('%Y-%m-%d %H:%M:%S'),
        'formato': archivo_obj.formato,
        'estado': 'Subido'
    })

def lista_archivos_api(request):
    archivos = Archivo.objects.order_by('-created_at')[:20]
    data = [{
        'idarchivo': a.idarchivo,  # necesario para firmar/verificar
        'nombre': a.nombre,
        'peso': a.peso,
        'unidad': a.unidad,
        'formato': a.formato,
        'created_at': a.created_at.strftime('%Y-%m-%d %H:%M:%S')
    } for a in archivos]
    return JsonResponse(data, safe=False)
@csrf_exempt
def firmar_archivo(request, idarchivo):
    try:
        archivo = Archivo.objects.get(pk=idarchivo)

        if archivo.firma:
            return JsonResponse({'message': 'Este archivo ya está firmado'}, status=400)

        # Ruta al archivo en disco
        path = os.path.join(settings.MEDIA_ROOT, archivo.directorio, archivo.nombre)

        if not os.path.exists(path):
            return JsonResponse({'message': 'El archivo no existe en el servidor'}, status=404)

        with open(path, 'rb') as f:
            data = f.read()

        # Generar clave privada (en producción: usar una clave persistente)
        private_key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
        signature = private_key.sign(
            data,
            padding.PSS(mgf=padding.MGF1(hashes.SHA256()), salt_length=padding.PSS.MAX_LENGTH),
            hashes.SHA256()
        )

        public_key_pem = private_key.public_key().public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        )

        # Guardar firma y clave pública
        archivo.firma = signature
        archivo.clave_publica = public_key_pem.decode('utf-8')
        archivo.save()

        return JsonResponse({'message': 'Archivo firmado correctamente'})
    
    except Archivo.DoesNotExist:
        return JsonResponse({'message': 'Archivo no encontrado'}, status=404)
    except Exception as e:
        return JsonResponse({'message': f'Error al firmar: {str(e)}'}, status=500)

@csrf_exempt
def verificar_firma(request, idarchivo):
    try:
        archivo = Archivo.objects.get(pk=idarchivo)

        if not archivo.firma or not archivo.clave_publica:
            return JsonResponse({'valido': False, 'message': 'Este archivo no tiene firma registrada'})

        path = os.path.join(settings.MEDIA_ROOT, archivo.directorio, archivo.nombre)

        if not os.path.exists(path):
            return JsonResponse({'valido': False, 'message': 'El archivo no existe en el servidor'})

        with open(path, 'rb') as f:
            data = f.read()

        public_key = load_pem_public_key(archivo.clave_publica.encode('utf-8'))

        public_key.verify(
            archivo.firma,
            data,
            padding.PSS(mgf=padding.MGF1(hashes.SHA256()), salt_length=padding.PSS.MAX_LENGTH),
            hashes.SHA256()
        )

        return JsonResponse({'valido': True, 'message': 'Firma válida'})

    except Archivo.DoesNotExist:
        return JsonResponse({'valido': False, 'message': 'Archivo no encontrado'}, status=404)
    except InvalidSignature:
        return JsonResponse({'valido': False, 'message': 'Firma inválida'})
    except Exception as e:
        return JsonResponse({'valido': False, 'message': f'Error: {str(e)}'}, status=500)


def descargar_con_firma(request, idarchivo):
    try:
        archivo = Archivo.objects.get(pk=idarchivo)

        if not archivo.firma:
            return HttpResponse("Archivo no está firmado", status=400)

        path_original = os.path.join(settings.MEDIA_ROOT, archivo.directorio, archivo.nombre)

        if not os.path.exists(path_original):
            return HttpResponse("Archivo no encontrado", status=404)

        zip_buffer = io.BytesIO()
        with zipfile.ZipFile(zip_buffer, 'w') as zf:
            # Agregar archivo original
            with open(path_original, 'rb') as f:
                zf.writestr(archivo.nombre, f.read())

            # Agregar firma
            zf.writestr('firma.sig', archivo.firma)

            # Agregar clave pública
            if archivo.clave_publica:
                zf.writestr('clave_publica.pem', archivo.clave_publica)

        zip_buffer.seek(0)
        response = HttpResponse(zip_buffer, content_type='application/zip')
        response['Content-Disposition'] = f'attachment; filename="{archivo.nombre}.zip"'
        return response

    except Archivo.DoesNotExist:
        return HttpResponse("Archivo no encontrado", status=404)
    except Exception as e:
        return HttpResponse(f"Error: {str(e)}", status=500)


def firmar_pdf_embebido(request, idarchivo):
    try:
        archivo = Archivo.objects.get(pk=idarchivo)

        # Validar que es PDF
        if not archivo.formato.lower() == 'application/pdf':
            return HttpResponse("Solo se pueden firmar archivos PDF embebidos", status=400)

        path = os.path.join(settings.MEDIA_ROOT, archivo.directorio, archivo.nombre)
        if not os.path.exists(path):
            return HttpResponse("Archivo no encontrado", status=404)

        if not archivo.firma or not archivo.clave_publica:
            return HttpResponse("El archivo debe estar firmado primero", status=400)

        # Crear PDF con la firma embebida como texto
        packet = io.BytesIO()
        can = canvas.Canvas(packet, pagesize=letter)
        can.setFont("Helvetica", 8)
        can.drawString(40, 100, "=== Firma Digital ===")
        can.drawString(40, 90, f"Archivo: {archivo.nombre}")
        can.drawString(40, 80, f"Hash SHA256: {hashlib.sha256(archivo.firma).hexdigest()}")
        can.drawString(40, 70, "Clave pública:")
        # Dividir la clave en líneas para que no se desborde
        y = 60
        for line in archivo.clave_publica.splitlines():
            can.drawString(40, y, line[:110])
            y -= 10
        can.save()
        packet.seek(0)

        # Leer PDF original y superponer la firma
        original = PdfReader(open(path, "rb"))
        overlay = PdfReader(packet)
        writer = PdfWriter()

        for i, page in enumerate(original.pages):
            if i == len(original.pages) - 1:  # solo en la última página
                page.merge_page(overlay.pages[0])
            writer.add_page(page)

        output_stream = io.BytesIO()
        writer.write(output_stream)

        # Enviar como archivo descargable
        response = HttpResponse(output_stream.getvalue(), content_type='application/pdf')
        response['Content-Disposition'] = f'attachment; filename="{archivo.nombre.replace(".pdf", "_firmado.pdf")}"'
        return response

    except Archivo.DoesNotExist:
        return HttpResponse("Archivo no encontrado", status=404)
    except Exception as e:
        return HttpResponse(f"Error al generar PDF firmado: {e}", status=500)

def firmar_pdf_todas_paginas(request, idarchivo):
    try:
        archivo = Archivo.objects.get(pk=idarchivo)

        if not archivo.formato.lower() == 'application/pdf':
            return HttpResponse("Solo se pueden firmar archivos PDF", status=400)

        path = os.path.join(settings.MEDIA_ROOT, archivo.directorio, archivo.nombre)
        if not os.path.exists(path):
            return HttpResponse("Archivo no encontrado", status=404)

        if not archivo.firma or not archivo.clave_publica:
            return HttpResponse("El archivo debe estar firmado primero", status=400)

        # Leer PDF original
        original_reader = PdfReader(open(path, "rb"))
        writer = PdfWriter()

        # Preparar info de firma
        hash_firma = hashlib.sha256(archivo.firma).hexdigest()
        clave_dividida = archivo.clave_publica.splitlines()

        for i, page in enumerate(original_reader.pages):
            # Crear overlay para cada página
            packet = io.BytesIO()
            can = canvas.Canvas(packet, pagesize=letter)
            can.setFont("Helvetica", 7)
            can.drawString(40, 50, f"Firma Digital - Página {i+1}")
            can.drawString(40, 40, f"SHA256: {hash_firma[:32]}...")
            y = 30
            for line in clave_dividida[:3]:  # mostrar solo 3 líneas para no saturar
                can.drawString(40, y, line[:100])
                y -= 10
            can.save()
            packet.seek(0)

            # Aplicar overlay a la página actual
            overlay_page = PdfReader(packet).pages[0]
            page.merge_page(overlay_page)
            writer.add_page(page)

        output_stream = io.BytesIO()
        writer.write(output_stream)

        response = HttpResponse(output_stream.getvalue(), content_type='application/pdf')
        response['Content-Disposition'] = f'attachment; filename="{archivo.nombre.replace(".pdf", "_firmado_todas.pdf")}"'
        return response

    except Archivo.DoesNotExist:
        return HttpResponse("Archivo no encontrado", status=404)
    except Exception as e:
        return HttpResponse(f"Error al firmar PDF: {e}", status=500)
def logout_view(request):
    token = request.COOKIES.get('access_token')

    if token:
        # Opcional: desactivar token en la tabla LOGIN
        try:
            login_entry = Login.objects.get(access_token=token)
            login_entry.estado = 0  # por ejemplo: 0 = cerrado
            login_entry.save()
        except Login.DoesNotExist:
            pass

    # Borrar la cookie del token
    response = redirect('/login/')
    response.delete_cookie('access_token')
    return response

def signin(request):
    if request.user.is_authenticated:
        return redirect('/')
    else:
        if request.method=="POST":
            username=request.POST['username']
            password=request.POST["password"]
            user=authenticate(username=username,password=password)
            if user is not None:
                login(request,user)
                return redirect('/')
            else:
                return redirect('/signin')
        else:
            return render(request,"usuario/login.html")

def signout(request):
    logout(request)
    return redirect('/signin')

def signup(request):
    if request.method=="POST":
        username=request.POST['username']
        password=request.POST['password']
        confpassword=request.POST['confirmpassword']
        if password==confpassword:
            user=User.objects.create_user(username=username,password=password)
            user.save()
            login(request,user)
            return redirect('/')
        else:
            return redirect('/signup')
    else:
        return render(request,"signup.html")
    
#def upload(request):
#    if request.user.is_authenticated:
#        if request.method=="POST":
#            pr=profilepic.objects.all().filter(user=request.user)
#            pr.delete()
#            pic=request.FILES['pic']
#            new=profilepic(user=request.user,pic=pic)
#            new.save()
#            return redirect('/home')
#        else:
#            return redirect('/home')
#    else:
#        return redirect('/home')


def opinion_form_view(request):
    if request.method == 'POST':
        Opinion.objects.create(
            titulo=request.POST.get('titulo'),
            descripcion=request.POST.get('descripcion'),
            tipo=request.POST.get('tipo'),
            valoracion=request.POST.get('valoracion'),
            idcliente_id=request.POST.get('idcliente'),
            estado='A'
        )
        return redirect('opinion_list')
    return render(request, 'opinion/opinion_form.html')

def opinion_list_view(request):
    opiniones = Opinion.objects.all()
    return render(request, 'opinion/opinion_list.html', {'opiniones': opiniones})

def opinion_update_view(request, idopinion):
    opinion = get_object_or_404(Opinion, idopinion=idopinion)
    if request.method == 'POST':
        opinion.titulo = request.POST.get('titulo')
        opinion.descripcion = request.POST.get('descripcion')
        opinion.tipo = request.POST.get('tipo')
        opinion.valoracion = request.POST.get('valoracion')
        opinion.idcliente_id = request.POST.get('idcliente')
        opinion.save()
        return redirect('opinion_list')
    return render(request, 'opinion/opinion_form.html', {'opinion': opinion})


@csrf_exempt
def validar_usuario(request):
    data = json.loads(request.body)
    nombre = data.get('nombres')
    correo = data.get('correo')

    # Buscar si ya existe el usuario por su correo (usuario = correo)
    usuario = Usuario.objects.filter(usuario=correo).first()

    if usuario:
        return JsonResponse({'exists': True, 'idusuario': usuario.idusuario})

    # Crear nueva persona y usuario
    persona = Persona.objects.create(nombres=nombre)
    usuario = Usuario.objects.create(idpersona=persona, usuario=correo)

    return JsonResponse({'exists': False, 'idusuario': usuario.idusuario})

@csrf_exempt
def obtener_historial(request):
    import json
    data = json.loads(request.body)
    idusuario = data.get('idusuario')

    conversaciones = Conversacion.objects.filter(idusuario_id=idusuario).order_by('fecha')
    historial = []
    for c in conversaciones:
        historial.append({
            'mensaje': c.mensaje,
            'respuesta': c.respuesta,
            'fecha': c.fecha.strftime('%Y-%m-%d %H:%M')
        })

    return JsonResponse({'historial': historial})
@csrf_exempt
def enviar_a_dialogflow(request):
    data = json.loads(request.body)
    idusuario = data.get('idusuario')
    mensaje = data.get('mensaje')
    print(datetime.datetime.now())
    respuesta = obtener_respuesta_dialogflow(mensaje, session_id=str(idusuario))
    Conversacion.objects.create(
        mensaje=mensaje,
        respuesta=respuesta,
        idusuario_id=idusuario
    )

    return JsonResponse({'respuesta': respuesta})

@csrf_exempt
def guardar_conversacion(request):
    data = json.loads(request.body)
    idusuario = data['idusuario']
    mensaje = data['mensaje']
    respuesta = data['respuesta']

    Conversacion.objects.create(mensaje=mensaje, respuesta=respuesta, idusuario_id=idusuario)
    return JsonResponse({'success': True})

@csrf_exempt
def guardar_opinion(request):
    data = json.loads(request.body)
    idusuario = data['idusuario']
    tipo = data['tipo']
    titulo = data['titulo']
    descripcion = data['descripcion']
    valoracion = data['valoracion']

    Opinion.objects.create(
        tipo=tipo,
        titulo=titulo,
        descripcion=descripcion,
        valoracion=valoracion,
        estado='A',
        idusuario_id=idusuario
    )
    return JsonResponse({'success': True})

#views empresa
