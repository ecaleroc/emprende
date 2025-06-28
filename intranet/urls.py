from django.urls import path, include
from rest_framework.routers import DefaultRouter
from core.api import LoginViewSet, UsuarioViewSet,OpinionViewSet
from .  import views
from django.conf import settings
from django.conf.urls.static import static
from intranet.views import login_view,intranet_view,logout_view,opinion_form_view,opinion_list_view,opinion_update_view,chat_view, registro_usuario_view
router = DefaultRouter()
router.register(r'opinion', OpinionViewSet, 'opinion')
router.register(r'login', LoginViewSet,'login')
router.register(r'usuario', UsuarioViewSet,'usuario')
urlpatterns = [
    path('api/', include(router.urls)),
    path('login/', login_view, name='login'),
    path('registro-usuario/', registro_usuario_view, name='registro-usuario'),
    path('chat/', chat_view, name='chat'),
    path('intranet/', intranet_view, name='intranet'),
    path('logout/', logout_view, name='logout'),  # nueva línea
    path('intranet2/', include(router.urls)),
    path('opiniones/nueva/', opinion_form_view, name='opinion_create'),
    #path('opiniones/', opinion_list_view, name='opinion_list'),
    path('opiniones/editar/<int:idopinion>/', opinion_update_view, name='opinion_update'),
    path('api/validar_usuario/', views.validar_usuario, name='validar_usuario'),
    path('api/dialogflow/', views.enviar_a_dialogflow),
    path('api/guardar_conversacion/', views.guardar_conversacion, name='guardar_conversacion'),
    path('api/guardar_opinion/', views.guardar_opinion, name='guardar_opinion'),
    path('api/chat/historial/', views.obtener_historial),
    path('api/chat/users/', views.ChatUsersView.as_view()),
    path('api/chat/history/<int:user_id>/', views.ChatHistoryView.as_view()),
    path('api/chat/reply/<int:user_id>/', views.AdminReplyView.as_view()),
    path('chatboot/', views.chat_admin_panel, name='chatboot'),

    path('crea-empresa/', views.crea_empresa_view, name='crea-empresa'),

    path('chat/admin-chat/', views.get_users, name='admin_chat'),
    path('chat/admin-chat/<int:user_id>/', views.get_conversation, name='chat_history'),
    path('chat/admin-chat/<int:user_id>/reply/', views.admin_reply, name='chat_reply'),

    path('empresas/tabla/', views.tabla_empresas_usuarios, name='tabla_empresas'),
    path('personas/', views.listar_personas, name='listar_personas'),

    
    path('ajax/persona/', views.obtener_o_registrar_persona, name='obtener_o_registrar_persona'),
    path('ajax/provincias/', views.get_provincias, name='get_provincias'),
    path('ajax/distritos/', views.get_distritos, name='get_distritos'),

    path('registro_empresa/', views.registro_empresa_view, name='registro_empresa'),
    path('registrar_persona/', views.registrar_persona, name='registrar_persona'),
    path('registrar_empresa/', views.registrar_empresa, name='registrar_empresa'),
    path('subir_archivo/', views.subir_archivo, name='subir_archivo2'),
    path('archivo/subir/', views.subir_archivo, name='subir_archivo'),

    path('subir/', views.subir_archivo, name='subir_archivo'),
    path('api/archivos/', views.lista_archivos_api, name='lista_archivos_api'),
    
    path('firmar/<int:idarchivo>/', views.firmar_archivo, name='firmar_archivo'),
    path('verificar/<int:idarchivo>/', views.verificar_firma, name='verificar_firma'),
    path('descargar-firmado/<int:idarchivo>/', views.descargar_con_firma, name='descargar_con_firma'),
    path('firmar-pdf-embebido/<int:idarchivo>/', views.firmar_pdf_embebido, name='firmar_pdf_embebido'),
    path('firmar-pdf-paginas/<int:idarchivo>/', views.firmar_pdf_todas_paginas, name='firmar_pdf_todas_paginas'),

    path('archivo/firma/usuario/', views.firmar_documento_persona, name='firmar_documento_persona'),
    path('archivo/timeline/', views.archivo_timeline, name='archivo_timeline'),
    path('archivo/firmar-multiple/<int:archivo_id>/', views.firmar_pdf_multiple, name='firmar_pdf_multiple'),

    path('empresa/agregar-socios/<int:pk>/', views.agregar_socio_view, name='agregar_socio'),
    path('api/personas/buscar/', views.buscar_persona_por_documento, name='buscar_persona_por_documento'),

    path('empresa/archivos/<int:pk>/', views.archivos_empresa_modal, name='archivos_empresa_modal'),
    path('empresa/firmar-documentos/<int:pk>/', views.archivos_empresa_modal, name='archivos_empresa_modal'),
    path('archivo/firmar/', views.firmar_archivo_api, name='firmar_archivo_api'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)