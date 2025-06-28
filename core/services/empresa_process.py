from django.utils import timezone
from django.core.files.base import ContentFile
from django.template.loader import render_to_string
from weasyprint import HTML
import os

from core.models.empresa import (
    ProcesoPaso, HistorialEmpresaProceso,
    Requisito, EmpresaRequisitoCumplido,
    Archivo, ArchivoFirma
)

class EmpresaProcessService:
    def __init__(self, empresa):
        self.empresa = empresa
    
    def iniciar_proceso(self):
        # Crear pasos del proceso si no existen
        pasos = [
            {'nombre': 'Reserva de nombre', 'orden': 1},
            {'nombre': 'Elaboración de minuta', 'orden': 2},
            {'nombre': 'Firma de minuta', 'orden': 3},
            {'nombre': 'Generación de escritura pública', 'orden': 4},
            {'nombre': 'Inscripción en SUNARP', 'orden': 5},
            {'nombre': 'Obtención de RUC', 'orden': 6},
            {'nombre': 'Obtención de permisos', 'orden': 7},
        ]
        
        for paso_data in pasos:
            ProcesoPaso.objects.get_or_create(
                nombre=paso_data['nombre'],
                defaults={
                    'orden': paso_data['orden'],
                    'descripcion': f"Paso {paso_data['orden']} del proceso de constitución de empresa",
                    'estado': 1  # Activo
                }
            )
        
        # Iniciar primer paso
        primer_paso = ProcesoPaso.objects.get(orden=1)
        HistorialEmpresaProceso.objects.create(
            idempresa=self.empresa,
            idprocesopaso=primer_paso,
            estado=2  # En progreso
        )
        
        # Crear requisitos iniciales
        self._crear_requisitos_iniciales()
    
    def _crear_requisitos_iniciales(self):
        requisitos = [
            {
                'nombre': 'Reserva de nombre en SUNARP',
                'tipo': 'DOCUMENTO',
                'obligatorio': True,
                'descripcion': 'Reserva del nombre comercial en SUNARP'
            },
            {
                'nombre': 'Minuta de constitución',
                'tipo': 'DOCUMENTO',
                'obligatorio': True,
                'descripcion': 'Minuta de constitución de la empresa'
            },
            {
                'nombre': 'Escritura pública',
                'tipo': 'DOCUMENTO',
                'obligatorio': True,
                'descripcion': 'Escritura pública de constitución de la empresa'
            },
            {
                'nombre': 'Inscripción SUNARP',
                'tipo': 'DOCUMENTO',
                'obligatorio': True,
                'descripcion': 'Constancia de inscripción en SUNARP'
            },
            {
                'nombre': 'RUC',
                'tipo': 'INFORMACION',
                'obligatorio': True,
                'descripcion': 'Número de RUC de la empresa'
            }
        ]
        
        for req in requisitos:
            Requisito.objects.get_or_create(
                nombre_requisito=req['nombre'],
                defaults={
                    'tipo_requisito': req['tipo'],
                    'es_obligatorio': req['obligatorio'],
                    'descripcion_requisito': req['descripcion']
                }
            )
    
    def completar_paso_actual(self, observaciones=None):
        # Obtener paso actual en progreso
        historial = HistorialEmpresaProceso.objects.filter(
            idempresa=self.empresa,
            estado=2  # En progreso
        ).first()
        
        if historial:
            historial.fecha_completado = timezone.now()
            historial.observaciones = observaciones
            historial.estado = 3  # Completado
            historial.save()
            
            # Obtener siguiente paso
            siguiente_paso = ProcesoPaso.objects.filter(
                orden=historial.idprocesopaso.orden + 1
            ).first()
            
            if siguiente_paso:
                HistorialEmpresaProceso.objects.create(
                    idempresa=self.empresa,
                    idprocesopaso=siguiente_paso,
                    estado=2  # En progreso
                )
                return siguiente_paso
        
        return None
    
    def generar_documento_pdf(self, template_name, context, nombre_archivo):
        # Renderizar HTML a PDF
        html_string = render_to_string(template_name, context)
        html = HTML(string=html_string, base_url=os.getenv('BASE_URL', 'http://localhost:8000'))
        pdf_bytes = html.write_pdf()
        
        # Crear archivo en el sistema
        archivo = Archivo.objects.create(
            nombre=nombre_archivo,
            descripcion=f"{nombre_archivo} generado automáticamente",
            formato='pdf',
            peso=len(pdf_bytes) / 1024,  # KB
            unidad='KB',
            requiere_firma_digital=True,
            iddirectorio=1  # Directorio por defecto
        )
        
        archivo.archivo.save(nombre_archivo, ContentFile(pdf_bytes))
        return archivo