$(document).ready(function() {
  $(".form_q").on("click", function(event){
    event.preventDefault();
    var id = $(this).serialize(); //returns id as a hash ex: id=1
    console.log(this);
    $.post('/vote/question', id, function(data) {
      $("#vq" + id.slice(-1)).text("[" + data + " votes]");
    });
  });
  $(".form_a").on("click", function(event){
    event.preventDefault();
    var id = $(this).serialize(); //returns id as a hash ex: id=1
    console.log($(this).serialize());
    console.log("*****************");
    $.post('/vote/answer', id, function(data) {
      console.log(data);
      $("#va" + id.slice(-1)).text("[" + data + " votes]");
    });
  });
});