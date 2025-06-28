import requests
from django.conf import settings

class SunarpService:
    def __init__(self):
        self.base_url = settings.SUNARP_API_URL
        self.api_key = settings.SUNARP_API_KEY
    
    def verificar_nombre_disponible(self, nombre):
        """
        Verifica si un nombre de empresa está disponible en SUNARP
        """
        try:
            response = requests.get(
                f"{self.base_url}/verificar-nombre",
                params={'nombre': nombre},
                headers={'Authorization': f"Bearer {self.api_key}"}
            )
            response.raise_for_status()
            return response.json().get('disponible', False)
        except requests.RequestException:
            # En caso de error, asumimos que el nombre no está disponible
            return False
    
    def reservar_nombre(self, nombre):
        """
        Reserva un nombre de empresa en SUNARP
        """
        try:
            response = requests.post(
                f"{self.base_url}/reservar-nombre",
                json={'nombre': nombre},
                headers={'Authorization': f"Bearer {self.api_key}"}
            )
            response.raise_for_status()
            return {
                'success': True,
                'numero_reserva': response.json().get('numero_reserva'),
                'documento_url': response.json().get('documento_url')
            }
        except requests.RequestException as e:
            return {
                'success': False,
                'message': str(e)
            }
    
    def inscribir_empresa(self, empresa):
        """
        Inscribe una empresa en SUNARP
        """
        try:
            # Preparar datos de la empresa
            data = {
                'nombre': empresa.idpersona.nombres,
                'tipo_empresa': empresa.tipo_empresa,
                'actividad': empresa.actividad_negocio,
                'socios': [
                    {
                        'nombre': socio.idpersona.nombre_completo(),
                        'documento': socio.idpersona.nrodocumento,
                        'aporte': socio.aporte_capital
                    }
                    for socio in empresa.empresasocio_set.all()
                ]
            }
            
            response = requests.post(
                f"{self.base_url}/inscribir-empresa",
                json=data,
                headers={'Authorization': f"Bearer {self.api_key}"}
            )
            response.raise_for_status()
            
            return {
                'success': True,
                'numero_inscripcion': response.json().get('numero_inscripcion'),
                'documento_url': response.json().get('documento_url')
            }
        except requests.RequestException as e:
            return {
                'success': False,
                'message': str(e)
            }