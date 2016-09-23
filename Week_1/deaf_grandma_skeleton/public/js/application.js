$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página.

  $("#form1").on("submit", function(event){
    event.preventDefault();
    var data_s = ( $( this ).serialize() );
    $.post( '/abuelita', data_s, function( data ) {
      $("#ajax_method").html("<h3>Tu Abuelita dice: " + data + "</h3>");
    });
  });
});
