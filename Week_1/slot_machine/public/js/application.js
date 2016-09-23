$(document).ready(function() {
  $("#form1").on("submit", function(event){
    event.preventDefault();
    $.post('/rolls', function( data ) {
      $("#die").html(data);
      // console.log(data);
    });
  });
});
