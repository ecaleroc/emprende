from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views
from django.contrib import admin
from django.urls import path
from core.views import *
from django.conf import settings
from django.conf.urls.static import static
from core.api import LoginViewSet, OpinionViewSet, UsuarioViewSet
from core.views import chat_api_view, opinion_view
router = DefaultRouter()
router.register(r'login', LoginViewSet,'login')
router.register(r'opinion', OpinionViewSet, 'opinion')
router.register(r'usuario', UsuarioViewSet, 'usuario')

urlpatterns = [

    path('opinar/', opinion_view, name='opinar'),

    path('chat/api/', chat_api_view, name='chat_api'),
    path('', views.index, name='index'),
     path('admin/', admin.site.urls),
    path('intranet2/', include(router.urls)),

    path('opiniones2/', views.opinion_list),
    path('opiniones/<int:pk>/', views.opinion_detail),

]