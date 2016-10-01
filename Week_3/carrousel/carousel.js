$(document).ready(function() {

    /// go left
  $('#previous_frame').on("click", function(){
    var margin = parseInt($('.frames').css('marginLeft'));
    var newmargin =  Math.ceil((margin + 1) / 620) * 620;

    if (newmargin === 620){
      $('.frames').css('marginLeft', '300%');
      newmargin = -1240;
    };

    if (margin == 0){
      $('.frames').css('marginLeft', '-300%');
    };

    $('.frames').animate({
      marginLeft: newmargin,
    }, 1000 );
      console.log(margin);
      console.log(newmargin);
  });


    /// go right
  $('#next_frame').on("click", function(){
    var margin = parseInt($('.frames').css('marginLeft'));
    var newmargin = Math.floor((margin - 1) / 620) * 620;

    if (newmargin === -2480){
      $('.frames').css('marginLeft', '0%');
      newmargin = -620;
    };

    $('.frames').animate({
      marginLeft: parseInt(newmargin),
    }, 1000 );
      console.log(margin);
      console.log(newmargin);
  });
});
