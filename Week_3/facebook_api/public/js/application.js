$(document).ready(function() {

window.fbAsyncInit = function() {
  console.log("start");
    FB.init({
      appId: "180375719036577",
      version: 'v2.6',
      cookie: true // IMPORTANT must enable cookies to allow the server to access the session
    });
    console.log("fb init");

    $('input[name=login]').click(function(e) {
      e.preventDefault();
      FB.login(function(response) {
        if (response.authResponse) {
          $.get('/auth/facebook/callback', function(){  
            window.location.href = '/profile';
          });
        }else{
          $('#msg').replaceWith("<p id='msg'>Please check your info and try again</p>");
        }
      }); // if you want custom scopes, pass them as an extra, final argument to FB.login
    });
  };

  (function(d, s, id){
    console.log("d, s, id");
           var js, fjs = d.getElementsByTagName(s)[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement(s); js.id = id;
           js.src = "//connect.facebook.net/en_US/sdk.js";
           fjs.parentNode.insertBefore(js, fjs);
            console.log("d, s, id: done");
  }(document, 'script', 'facebook-jssdk'));


  //   window.fbAsyncInit = function() {
  //   FB.init({
  //     appId      : '180375719036577',
  //     xfbml      : true,
  //     version    : 'v2.8'
  //   });
  //   FB.AppEvents.logPageView();

  //   FB.getLoginStatus(function(response) {
  //     if (response.status === 'connected') {
  //       user = {}
  //       user.name = "karla"
  //       user.email = "@gmail.com"
  //       user.provider = "facebook"
  //       user.uid = response.authResponse.userID;
  //       user.oauth_token = response.authResponse.accessToken;
  //       user.oauth_expires_at = response.authResponse.expiresIn;

  //       $.post('/facebook/callback', user, function(){
  //         window.location.href = '/profile';
  //       });
  //     }
  //   });
  // };

  // (function(d, s, id){
  //    var js, fjs = d.getElementsByTagName(s)[0];
  //    if (d.getElementById(id)) {return;}
  //    js = d.createElement(s); js.id = id;
  //    js.src = "//connect.facebook.net/en_US/sdk.js";
  //    fjs.parentNode.insertBefore(js, fjs);
  //  }(document, 'script', 'facebook-jssdk'));
});
