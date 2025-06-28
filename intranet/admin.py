from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from intranet.models import Opinion
from .models import ArchivoFirma

@admin.register(Opinion)
class OpinionAdmin(admin.ModelAdmin):
    list_display = ['idopinion', 'idusuario', 'descripcion', 'valoracion']
    list_filter = ['valoracion']


@admin.register(ArchivoFirma)
class ArchivoFirmaAdmin(admin.ModelAdmin):
    list_display = ['idarchivo', 'idpersona', 'fecha_firma', 'estado']
    list_filter = ['estado']
    search_fields = ['persona__nombres', 'archivo__NOMBRE']