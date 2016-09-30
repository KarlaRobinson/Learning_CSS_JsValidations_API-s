$(document).ready(function() {

  $("input[value='Register!']").on("click", function(event){
    event.preventDefault();
    var name = $("#register input[placeholder='name']").val(); 
    var email = $("#register input[placeholder='email']").val();
    var password = $("#register input[placeholder='password']").val(); 

    // check if a name was entered
    if (name == ""){
      $('#error p').append("Please enter your name.");
      // check if an email was entered
    } else if (email == ""){
      $('#error p').append("Please enter an email.");
      // check if a password was entered
    } else if (password == ""){
      $('#error p').append("Please enter an 8 digit password.");
      // check if email is valid
    } else if (email != ""){
      alert("email: " + email);
      $('#error p').append("Good");
      // go to create user
    } else if (0 == 1){
      $.post('/user', survey, function(){
        // window.location.href = '/login';
      });
    };
  });
});
