let socket = io("http://localhost:5001");
let selectedUserId = null;
let onlineUsers = new Set();

function loadUsers() {
  $.get('/chat/admin-chat/', function(data) {
    $('#user-list').empty();
    data.forEach(u => {
      const onlineClass = onlineUsers.has(u.id) ? 'text-success' : 'text-muted';
      $('#user-list').append(`
        <a href="#" class="list-group-item user d-flex justify-content-between align-items-center" data-id="${u.id}">
          <span class="${onlineClass}">${u.correo}</span>
          <span class="badge bg-danger">${u.no_leidos}</span>
        </a>`);
    });
  });
}

$(function() {


    // Al hacer clic en usuario
  $('#user-list').on('click', '.user', function () {
    selectedUserId = $(this).data('id');
    $('#chat-with').text(`Chat con ${$(this).text().trim()}`);
    $('#chat-window').empty();

    $.get(`/chat/admin-chat/${selectedUserId}/`, function (msgs) {
      msgs.forEach(m => {
        mensaje= '<div class="conversation-list">'
                +'           <div class="ctext-wrap">'
                +'               <div class="ctext-wrap-content">'
                +'                   <h5 class="conversation-name"><a href="#" class="user-name">Jennie Sherlock</a>'
                +'                       <span class="time">'+m.fecha+'</span></h5>'
                +'                   <p class="mb-0">'+m.mensaje+'</p>'
                +'               </div>'
                +'               <div class="dropdown align-self-start">'
                +'                   <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"'
                +'                       aria-haspopup="true" aria-expanded="false">'
                +'                       <i class="bx bx-dots-vertical-rounded"></i>'
                +'                   </a>'
                +'                   <div class="dropdown-menu">'
                +'                       <a class="dropdown-item" href="#">Copy</a>'
                +'                       <a class="dropdown-item" href="#">Save</a>'
                +'                       <a class="dropdown-item" href="#">Forward</a>'
                +'                       <a class="dropdown-item" href="#">Delete</a>'
                +'                   </div>'
                +'               </div>'
                +'           </div>'
                +'       </div>"';
        respuesta = '<div class="conversation-list">'
                    +'      <div class="ctext-wrap">'
                    +'          <div class="ctext-wrap-content">'
                    +'              <h5 class="conversation-name"><a href="#" class="user-name">Shawn</a> <span'
                    +'                      class="time">'+m.fecha+'</span></h5>'
                    +'              <p class="mb-0">'+m.respuesta+'</p>'
                    +'          </div>'
                    +'          <div class="dropdown align-self-start">'
                    +'              <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"'
                    +'                  aria-haspopup="true" aria-expanded="false">'
                    +'                  <i class="bx bx-dots-vertical-rounded"></i>'
                    +'              </a>'
                    +'              <div class="dropdown-menu">'
                    +'                  <a class="dropdown-item" href="#">Copy</a>'
                    +'                  <a class="dropdown-item" href="#">Save</a>'
                    +'                  <a class="dropdown-item" href="#">Forward</a>'
                    +'                  <a class="dropdown-item" href="#">Delete</a>'
                    +'              </div>'
                    +'          </div>'
                    +'      </div>'
                    +'  </div>';
        if (m.mensaje) $('#chat-window').append(`<li> ${mensaje}</li>`);
        if (m.respuesta) $('#chat-window').append(`<li class="right">${respuesta}</li>`);
      });
    });

    socket.emit('join', { user_id: selectedUserId });
  });

  $('#send-reply').click(function() {
    const text = $('#reply-text').val();
    if (!text || !selectedUserId) return;
    $.post(`/chat/admin-chat/${selectedUserId}/reply/`, JSON.stringify({respuesta: text}));
    socket.emit('admin_reply', {user_id: selectedUserId, text: text});
    $('#chat-window').append(`<div><b>Admin:</b> ${text}</div>`);
    $('#reply-text').val('');
  });

  socket.on('receive_message', function(data) {
    if (data.from === 'user') {
      $('#chat-window').append(`<div><b>Usuario:</b> ${data.text}</div>`);
    }
  });

  loadUsers();
});

socket.on("receive_message", function(data) {
  if (data.from === "user") {
    $('#chat-window').append(`<div><b>Usuario:</b> ${data.text}</div>`);
  }
});


