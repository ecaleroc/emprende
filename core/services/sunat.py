import requests
from django.conf import settings
from core.models.empresa import (
    EmpresaRequisitoCumplido
)
class SunatService:
    def __init__(self):
        self.base_url = settings.SUNAT_API_URL
        self.api_key = settings.SUNAT_API_KEY
    
    def obtener_ruc(self, empresa, regimen_tributario):
        """
        Obtiene un RUC para la empresa desde SUNAT
        """
        try:
            # Preparar datos de la empresa
            data = {
                'razon_social': empresa.idpersona.nombres,
                'tipo_empresa': empresa.tipo_empresa,
                'actividad': empresa.actividad_negocio,
                'regimen_tributario': regimen_tributario,
                'inscripcion_sunarp': EmpresaRequisitoCumplido.objects.get(
                    idempresa=empresa,
                    idrequisito__nombre_requisito='Inscripción SUNARP'
                ).valor_dato
            }
            
            response = requests.post(
                f"{self.base_url}/obtener-ruc",
                json=data,
                headers={'Authorization': f"Bearer {self.api_key}"}
            )
            response.raise_for_status()
            
            return {
                'success': True,
                'ruc': response.json().get('ruc'),
                'constancia_url': response.json().get('constancia_url')
            }
        except requests.RequestException as e:
            return {
                'success': False,
                'message': str(e)
            }
        except EmpresaRequisitoCumplido.DoesNotExist:
            return {
                'success': False,
                'message': 'No se encontró el número de inscripción en SUNARP'
            }