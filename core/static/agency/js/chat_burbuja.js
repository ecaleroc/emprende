let socket = io("http://localhost:5001", {
  reconnectionAttempts: 5,
  timeout: 2000
});

let IDUSUARIO = null;
let chatActivo = false;

// Inicializa conexión de socket una vez validado
function iniciarChat(nombres, correo) {
  $.ajax({
    url: "/api/validar_usuario/",
    method: "POST",
    contentType: "application/json",
    data: JSON.stringify({ nombres, correo }),
    success: function (res) {
      IDUSUARIO = res.idusuario;
      $('#user-modal').fadeOut();
      $('#chat-box').fadeIn();
      chatActivo = true;

      $('#chat-log').html('');
      socket.emit("join", { user_id: IDUSUARIO });

      $.ajax({
        url: "/api/chat/historial/",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({ idusuario: IDUSUARIO }),
        success: function (data) {
          data.historial.forEach(item => {
            if (item.mensaje) addMensaje("user", item.mensaje, item.fecha);
            if (item.respuesta) addMensaje("admin", item.respuesta, item.fecha);
          });
        },
        error: () => alert('No se pudo cargar el historial.')
      });
    },
    error: () => alert('Error al validar usuario.')
  });
}

// Renderiza mensaje en burbuja
function addMensaje(from, texto, fecha = null) {
  const quien = from === "user" ? "Tú" : "Admin";
  const clase = from === "user" ? "bubble-user" : "bubble-bot";
  $('#chat-log').append(`
    <div class="chat-message-container">
      <div class="chat-bubble ${clase}">
        <strong>${quien}:</strong> ${texto}
        <div class="chat-timestamp">${fecha || new Date().toLocaleString()}</div>
      </div>
    </div>
  `);
  $('#chat-log').scrollTop($('#chat-log')[0].scrollHeight);
}

// Enviar mensaje
function enviarMensaje() {
  const mensaje = $('#mensaje').val().trim();
  if (!mensaje || !IDUSUARIO) {
    alert("Escribe un mensaje válido.");
    return;
  }

  // Mostrar mensaje del usuario en la burbuja
  addMensaje("user", mensaje);
  $('#mensaje').val('');

  // Enviar mensaje al backend (Dialogflow API)
  $.ajax({
    url: "/api/dialogflow/",
    method: "POST",
    contentType: "application/json",
    data: JSON.stringify({ idusuario: IDUSUARIO, mensaje: mensaje }),
    success: function(res) {
      // Mostrar respuesta del bot si viene con éxito
      if (res.respuesta) {
        addMensaje("bot", res.respuesta);
      } else {
        addMensaje("bot", "Lo siento, no entendí eso.");
      }
    },
    error: function() {
      addMensaje("bot", "Ocurrió un error al contactar con el chatbot.");
    }
  });
}


// Envío al hacer clic
$('#enviar-mensaje').on('click', enviarMensaje);

// Enter = enviar mensaje
$('#mensaje').on('keypress', function (e) {
  if (e.which === 13) enviarMensaje();
});

// Botón flotante abrir/minimizar chat
$('#toggle-chat').on('click', function () {
  if (chatActivo) {
    $('#chat-box').hide();
    chatActivo = false;
  } else if (IDUSUARIO) {
    $('#chat-box').show();
    chatActivo = true;
  } else {
    $('#user-modal').fadeIn();
  }
});

// Validación de usuario
$('#validar-usuario').on('click', function () {
  const nombres = $('#nombres').val().trim();
  const correo = $('#correo').val().trim();
  if (!nombres || !correo) return alert("Completa tus datos.");
  iniciarChat(nombres, correo);
});

// Escuchar mensajes entrantes desde admin
socket.on("receive_message", function (data) {
  if (data.from === "admin") {
    addMensaje("admin", data.text);
  }
});

// Opcional: conexión fallida
socket.on("connect_error", () => {
  console.error("❌ Error de conexión con el servidor de sockets");
});

socket.on("connect", () => {
  console.log("✅ Conectado a Socket.IO");
});

socket.on("receive_message", function (data) {
  if (data.from === "admin") {
    addMensaje("admin", data.text);
  }
});