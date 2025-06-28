from channels.generic.websocket import AsyncWebsocketConsumer
import json

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.user_id = self.scope['url_route']['kwargs']['user_id']
        self.room = f"chat_{self.user_id}"
        await self.channel_layer.group_add(self.room, self.channel_name)
        await self.accept()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(self.room, self.channel_name)

    async def receive(self, text_data):
        data = json.loads(text_data)
        await self.channel_layer.group_send(
            self.room,
            {
                'type': 'chat_message',
                'mensaje': data.get('mensaje'),
                'respuesta': data.get('respuesta'),
            }
        )

    async def chat_message(self, event):
        await self.send(text_data=json.dumps(event))