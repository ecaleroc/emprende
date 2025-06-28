import os
from google.cloud import dialogflow_v2 as dialogflow
from django.conf import settings
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import requests
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = str(settings.DIALOGFLOW_CREDENTIALS_PATH)
@csrf_exempt
def enviar_a_dialogflow(request):
    import json
    from intranet.models import Conversacion
    data = json.loads(request.body)

    mensaje = data.get("mensaje")
    idusuario = data.get("idusuario")

    if not mensaje or not idusuario:
        return JsonResponse({"error": "Datos incompletos"}, status=400)

    respuesta = obtener_respuesta_dialogflow(mensaje, session_id=str(idusuario))

    Conversacion.objects.create(
        mensaje=mensaje,
        respuesta=respuesta,
        idusuario_id=idusuario,
        estad_lectura=False
    )

    # 🔥 Notifica al servidor Flask que emita por socket
    requests.post("http://localhost:5001/api/emit", json={
        "user_id": idusuario,
        "respuesta": respuesta
    })

    return JsonResponse({"respuesta": respuesta})
def obtener_respuesta_dialogflow(texto_usuario, session_id, language_code='es'):
    session_client = dialogflow.SessionsClient()
    session = session_client.session_path(settings.DIALOGFLOW_PROJECT_ID, session_id)

    text_input = dialogflow.types.TextInput(text=texto_usuario, language_code=language_code)
    query_input = dialogflow.types.QueryInput(text=text_input)

    response = session_client.detect_intent(session=session, query_input=query_input)
    return response.query_result.fulfillment_text