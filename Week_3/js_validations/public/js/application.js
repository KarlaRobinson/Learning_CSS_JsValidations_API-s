$(document).ready(function() {

  $("input[value='Register!']").on("click", function(event){
    event.preventDefault();
    alert("hi");
    if (0 == 1){
      $.post('/login', survey, function(data){
        window.location.href = '/login';
      });
    }
  });
});
