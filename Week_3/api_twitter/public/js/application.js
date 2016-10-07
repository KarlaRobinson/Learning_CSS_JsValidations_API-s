$(document).ready(function() {
	$('.container').on("click", 'input[name=search]', function(event){
    event.preventDefault();
    $('#load').css('display', 'block');
  });

});
