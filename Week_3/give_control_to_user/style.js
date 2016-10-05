$(function(){

  $('input[type=submit]').on("click", function(event){
    event.preventDefault();
    var sel = $('input[name=selector]').val();
    var prop = $('input[name=property]').val();
    var val = $('input[name=value]').val();

    $(sel).css(prop, val);
  });
});
