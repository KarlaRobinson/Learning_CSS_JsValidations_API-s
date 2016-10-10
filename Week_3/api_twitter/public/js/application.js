$(document).ready(function() {

  //search for another user's tweets
  $('.container').on("click", 'input[name=search]', function(event){
    $('input[name=search]').prop('disabled', true);
    event.preventDefault();
    user = {}
    // collect username of interest
    user.username = $('input[name=username]').val();
    // send user to route '/fetch' to see if twitter request is needed
    $.post('/fetch', user, function(go){
      if(go === "twitter"){
        // display spinner and request tweets from twitter
        $('#load').css('display', 'block');
        $.get('/twitter/' + user.username, function(){
          console.log("here: " + user.username);
          window.location.href = "/db/" + user.username;
        });
      }else{
        // display tweets from database
        window.location.href = "/db/" + user.username;
      }
    });
  });

  // create new tweet
  $('.container').on("click", 'input[name=tweet]', function(event){
    $('input[name=tweet]').unbind('click');
    event.preventDefault();
    tweet = {}
    tweet.text = $('input[name=text]').val();
    // send new tweet text to '/post', display spinner and then my tweets
    $.post('/tweet', tweet, function(){
      $('#load').css('display', 'block');
      $.get('/twitter/@karlasophiarob', function(){
            window.location.href = '/db/@karlasophiarob';
      });
    });
  }); 

});
