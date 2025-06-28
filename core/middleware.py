from django.utils.deprecation import MiddlewareMixin
from intranet.models import Usuario
class UsuarioMiddleware(MiddlewareMixin):
    def process_request(self, request):
        if hasattr(request, 'session') and 'user_id' in request.session:
            user_id = request.session['user_id']
            try:
                request.user = Usuario.objects.get(idusuario=user_id)
            except Usuario.DoesNotExist:
                request.user = None
        else:
            request.user = None