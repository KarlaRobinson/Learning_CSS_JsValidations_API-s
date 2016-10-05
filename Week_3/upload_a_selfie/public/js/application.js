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
  
  // expand pictures when clicked
  $('.many').on("click", function(event){

    $('.many').next().removeClass('temp');
    $('.many').next().addClass('hidden');
    medium = $(this).next()
    $(medium).removeClass('hidden');
    $(medium).addClass('temp');
    // $(medium).css('', '');
    $(medium).css('position', 'absolute');
    $(medium).css('top', '0px');
    $(medium).css('left', '0px');
    $(medium).css('border', '100px solid black');
    
    $('body').css('background', 'black');
    $('#nav_bar').addClass('hidden');
    $('#register').parent().addClass('hidden');
  });

  $('html').on('click', '.temp', function(){
    $('body').css('background', 'none');
    $('#nav_bar').removeClass('hidden');
    $('#register').parent().removeClass('hidden');

    $('.many').next().removeClass('temp');
    $('.many').next().addClass('hidden');
  });




  $(function() {

    function prepSliders(){
      var albums = $('div div ul').parent().parent()
      $.each( albums, function( key, value ) {
        // find number of photos in the album
        var imageNum = $('#album' + key + ' .frames li').length;
        if(imageNum == 1){ $('#album' + key + ' .slider_controls').addClass('hidden');
        }else{
          // adjust slider width depending on the number of photos
          $('#album' + key + ' .frames').css("width", imageNum * 100 +'%');
          //move the last photo to the beginning of the list
          $('#album' + key + ' .frames li:last').insertBefore('#album' + key + ' .frames li:first');
          //reposition margin so that the first image(now second in the list) is visible
          $('#album' + key + ' .frames').css('margin-left', '-'+100+'%');
        }
      });
    };

    prepSliders();

    // right clicker
    $('.next_frame').click(function(){
      // know which album was clicked
      var album = $(this).parent().parent().attr('id');
      // check if album has less than 3 pictures
      if($('#' + album + ' .frames li').length == 1){
        $('.slider_controls').css("visibility", "hidden");
      }else if ($('#' + album + ' .frames li').length == 2){
        // first image becomes the last image and the margin shifts to still show first image
        $('#' + album + ' .frames li:first').insertAfter('#' + album + ' .frames li:last');
        $('#' + album + ' .frames').css('margin-left', '0%');
        // animate margin shift to the right
        $('#' + album + ' .frames').animate({marginLeft:'-100%'}, 700);
      }else{moveRight(album);}
    });


    // left clicker
    $('.previous_frame').click(function(){
      // know which album was clicked
      var album = $(this).parent().parent().attr('id');
      moveLeft(album);
    });

    function moveRight(album){
      $('#' + album + ' .frames').animate(
        {marginLeft:'-200%'},
        700,
        function(){
            //first image becomes the last image
            $('#' + album + ' .frames li:first').insertAfter('#' + album + ' .frames li:last');
            //margin returns to -100%
            $('#' + album + ' .frames').css('margin-left', '-100%');
        }
      );
    };


    function moveLeft(album){
      $('#' + album + ' .frames').animate(
        {marginLeft:0},
        700,
        function(){
            //last image becomes the first image
            $('#' + album + ' .frames li:last').insertBefore('#' + album + ' .frames li:first');
            //margin returns to -100%
            $('#' + album + ' .frames').css('margin-left', '-100%');
        }
      );
    };
  });
  
  // drag pictures around
  $("#sortable").sortable();

});
