from flask import Flask, request, jsonify
from flask_socketio import SocketIO, emit, join_room
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Inicializar Socket.IO
socketio = SocketIO(app, cors_allowed_origins="*")

# ============================
# SOCKET.IO EVENTOS EN VIVO
# ============================

@socketio.on('join')
def handle_join(data):
    room = f"user_{data['user_id']}"
    join_room(room)
    print(f"Usuario {data['user_id']} se unió a la sala {room}")

@socketio.on('user_message')
def handle_user_message(data):
    room = f"user_{data['user_id']}"
    emit('receive_message', {
        'from': 'user',
        'text': data['text']
    }, room=room)

@socketio.on('admin_reply')
def handle_admin_reply(data):
    room = f"user_{data['user_id']}"
    emit('receive_message', {
        'from': 'admin',
        'text': data['text']
    }, room=room)

# ============================
# ENDPOINT HTTP PARA EMITIR RESPUESTA DESDE DJANGO
# ============================

@app.route("/api/emit", methods=["POST"])
def emitir_respuesta():
    data = request.get_json()
    user_id = data.get("user_id")
    respuesta = data.get("respuesta")

    if not user_id or not respuesta:
        return jsonify({"error": "Datos incompletos"}), 400

    room = f"user_{user_id}"
    socketio.emit("receive_message", {
        "from": "admin",
        "text": respuesta
    }, room=room)

    return jsonify({"ok": True})

# ============================
# EJECUCIÓN DEL SERVIDOR
# ============================

if __name__ == '__main__':
    import eventlet
    eventlet.monkey_patch()
    socketio.run(app, host='0.0.0.0', port=5001, debug=True)
