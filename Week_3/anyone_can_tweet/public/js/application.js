$(document).ready(function() {
  // new tweet
  $('input[name=tweet]').on('click', function(event){
    $('input[name=tweet]').prop('disabled', true);
    event.preventDefault();
    tweet = {}
    tweet.text = $('input[name=text]').val();
    tweet.time = $('input[name=time]').val();
    if (tweet.text == ""){
      $('#error p').replaceWith("<p>Please enter a tweet</p>")
      $('input[name=tweet]').prop('disabled', false);
    }else{
      $.post('/tweet', tweet, function(job_id){
        // console.log(job_id);
        // check_again = setTimeout(job_status(job_id), 500);
        $('#load').css('display', 'block');
         window.location.href = '/refresh';
        job_status(job_id);
      });
    }
  });

  $('input[name=search]').on('click', function(event){
    $('input[name=search]').prop('disabled', true);
    event.preventDefault();
    username = $('input[name=username]').val();
    if (username == ""){
      $('#error p').replaceWith("<p>Please enter a username</p>")
      $('input[name=search]').prop('disabled', false);
    }else{
      window.location.href = '/fetch/' + username;
    }
  });

  function job_status(job_id){
    // job_id = "2345234534dfgsdfgsdfg"
          $.post('/status/' + job_id, function(status){
            if (status == "true"){
              $('#error p').replaceWith("<p>All tweets have been sent</p>")
              // alert('Your tweet has been sent');
              // window.location.href = '/refresh';
            }else{
              $('#error p').replaceWith("<p>Not yet</p>")
              // alert('Not yet');
              check_again = setTimeout(job_status, 3000, job_id);
            }
          });
  }

});
