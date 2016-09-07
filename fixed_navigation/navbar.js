$(window).ready(function () {
  $(window).scroll(function(){
    console.log("inside");
      var scroll_top = $(this).scrollTop();
      //var scroll_top updates as we scroll to an integer representative of the height of the .container
      if (scroll_top > 174){ $('.top-nav').css({ opacity: 0.5 });}
      if (scroll_top < 174){ $('.top-nav').css({ opacity: 1.0 });}
    $('#feedback').text('Currently at position: ' + scroll_top);
  });
});