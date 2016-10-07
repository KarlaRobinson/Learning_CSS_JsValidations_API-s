$(document).ready(function() {

  // $('.container').on("click", 'input[name=search]', function(event){
  //   event.preventDefault();
  //   $.post()
  //   console.log("event: " + event);
  //   // $('#load').css('display', 'block');
  //   // username = $('input[name=username]').val();
  //   // window.location.href = "/" + username;
  // });

  $('.container').on("click", 'input[name=search]', function(event){
    event.preventDefault();
    user = {}
    user.username = $('input[name=username]').val();
    window.location.href = "/test/" + user.username;
    console.log("username " + user)
    $.post('/fetch', user, function(go){
      console.log("callback: " + go)
      if(go === "twitter"){
        $('#load').css('display', 'block');
        $.get('/twitter/' + user.username, function(){
          window.location.href = "/db/" + user.username;
          // $('#load').css('display', 'none');
        });
      }else{
        window.location.href = "/db/" + user.username;
      }
    });
  });
});
