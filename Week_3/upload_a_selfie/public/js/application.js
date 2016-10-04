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
  
  // $('.many').on("click", function(event){
  //   event.preventDefault();

  //   $('.many').next().removeClass('temp');
  //   $('.many').next().addClass('hidden');
  //   lg = $(this).next()
  //   $(lg).removeClass('hidden');
  //   $(lg).addClass('temp');
  //   // $('#single').append(lg);
  //   $(lg).css('position', 'absolute');
  //   $(lg).css('top', '50px');
  //   $(lg).css('left', '0px');
  //   // $(lg).css('margin', '0px auto');

  //   $('body').css('background', 'black');
  // });

  // $('html').on('click', '.temp', function(){
  //   $('.many').next().removeClass('temp');
  //   $('.many').next().addClass('hidden');
  //   $('body').css('background', 'none');
  // });




  $(function() {
  // store slider in a variable
  var slider = $('.frames0');
  // store the elements inside of .frames
  var liItems = $('.frames0 li');
  //find number of elements (photos)
  var imageNumber = liItems.length;
  // store buttons in a variable
  var next = $('#next_frame0');
  var previous  = $('#previous_frame0');


  //adjust slider width depending on the number of photos
    slider.css("width", imageNumber * 100 +'%');
  //move the last photo to the beginning of the list
  $('.frames li:last').insertBefore('.frames li:first');
  //reposition margin so that the first image(now second in the list) is visible
  slider.css('margin-left', '-'+100+'%');



  // if(imageNumber == 0){
  //   $('.slider_controls').css("visibility", "hidden");
  // }
  // else if(imageNumber == 1){
  //   //ul width adjusts to the number of images
  //   liItems.css("width", 100 / imageNumber+'%');
  //   // slider is moved to 0
  //   slider.css('margin-left', 0+'%');
  //   //click right
  //   next.click(function(){
  //     alert("This album has only 1 photo");
  //   });

  //   previous.click(function(){
  //     alert("This album has only 1 photo");
  //   });
  //   slider.css('margin', '0%');
  // }
  // else if(imageNumber == 2){
  //   //ul width adjusts to the number of images
  //   liItems.css("width", 100 / imageNumber+'%');
  // }


  

  next.click(function(){
    moveRight();
  });

  previous.click(function(){
    moveLeft();
  });

  function moveRight(){
    slider.animate(
      {marginLeft:'-'+200+'%'},
      700,
      function(){
          //first image becomes the last image
          $('.frames0 li:first').insertAfter('.frames0 li:last');
          //margin returns to -100%
          slider.css('margin-left', '-'+100+'%');
    });
  }


  function moveLeft(){
    slider.animate(
      {marginLeft:0},
      700,
      function(){
          //last image becomes the first image
          $('.frames0 li:last').insertBefore('.frames0 li:first');
          //margin returns to -100%
          slider.css('margin-left', '-'+100+'%');
      });
      }
  });

});
