$(function(){
  $('.container').on("click", '#new_cmt_btn', function(event){
    $('#new_cmt_btn').replaceWith("<form id='new_cmt'><p></p><textarea  placeholder='Comment' name='new_cmt'></textarea>"
      + "<input type='text' placeholder='author' id='authorName'>"
      + "<input type='submit' value='Send' name='submit_new_cmt'></form>");
  });

$('.container').on("click", 'input[name=submit_new_cmt]', function(event){
    event.preventDefault();
    comment = $('textarea[name=new_cmt]').val();
    author = $('#authorName').val();

    if(comment != "" && author != ""){
      $("<li>" + comment + "<span class='author'>" + author + "</span></li>").insertAfter('ul li:last');
      $('#new_cmt').replaceWith("<button id='new_cmt_btn'>Nuevo Comentario</button>");

      post = {};
      post.comment = comment
      post.author = author

      $.post('/post', post, function(message){
        if(message === 'true'){
          $('#message').html("Your post has been saved to the database.");
        }else{
          $('#message').html("Your post could not be saved to the database.");
          $('ul li:last').remove();
        }
      });
    }else{ $('#new_cmt p').html("Please enter your comment and author name."); };
  });
});



















































































































































































































































