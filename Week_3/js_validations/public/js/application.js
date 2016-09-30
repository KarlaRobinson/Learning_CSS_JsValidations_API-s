$(document).ready(function() {

  $("input[value='Register!']").on("click", function(event){
    event.preventDefault();
    var name = $("#register input[placeholder='name']").val(); 
    var email = $("#register input[placeholder='email']").val();
    var password = $("#register input[placeholder='password']").val(); 

    $('#error p').replaceWith("<p></p>");
    // check if all fields were entered
    if (name == "" || email == "" || password == ""){
      $('#error p').append("Please fill in all fields.");
      //// check if email is valid
    } else if (email.match(/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/) == null){
      $('#error p').append("Please enter a valid email.");
      // check if password is 8 digits long
    } else if (password.length < 8){
      $('#error p').append("Please enter an 8 digit password.");
      //// check if password has a number
    } else if (password.match(/\d/) == null){
      $('#error p').append("Password must contain at least 1 number.");
      //// check if password has a capital letter
    } else if (password.match(/[A-Z]/) == null){
      $('#error p').append("Password must contain at least 1 capital letter.");
      // go to create user
    } else {
      // $('#error p').append("Good");
      $.post('/user', function(url){
        window.location.href = url;
      });
    };
  });
});
