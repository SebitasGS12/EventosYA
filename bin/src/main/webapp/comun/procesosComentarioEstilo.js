
var edicionEnCurso = false;

function mostrarEdit(btn) {
		
  if (edicionEnCurso) {
    alert("Debes editar o cancelar el comentario actual antes de continuar.");
    return;
  }
    var comentarioDiv = btn.parentNode.parentNode;
    var pContenido = comentarioDiv.querySelector('#pContenido');
    var pTextEditable = comentarioDiv.querySelector('#pTextEditable');
    var editarComentarioBtn = comentarioDiv.querySelector('#editComentario');
    var cancelarBtn= comentarioDiv.querySelector('#editCancelar');
    
    pContenido.style.display = 'none';
    pTextEditable.style.display = 'inline-block';
    editarComentarioBtn.style.display = 'inline-block';
    cancelarBtn.style.display = 'inline-block';
    btn.style.display = 'none';
    
    
      edicionEnCurso = true;

  }
  
function cancelarEdit(btn) {
  var comentarioDiv = btn.parentNode.parentNode;
  var pContenido = comentarioDiv.querySelector('#pContenido');
  var pTextEditable = comentarioDiv.querySelector('#pTextEditable');
  var editarComentarioBtn = comentarioDiv.querySelector('#editComentario');
  var editar = comentarioDiv.querySelector('#edit');

  pTextEditable.value = pContenido.innerHTML;
  pContenido.style.display = 'block';
  pTextEditable.style.display = 'none';
  
  
  editarComentarioBtn.style.display = 'none';
  editar.style.display = 'inline-block';
  
  btn.style.display = 'none';
  
  edicionEnCurso = false;
 }







  