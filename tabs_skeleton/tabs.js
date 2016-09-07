$(document).ready(function () {
  $('#tab1').css('display', 'block');
  $('.tabs a').on("click", function (){var tab = ($(this).attr('href'));
  
    num = Number(tab.slice(-1))

    $('li').removeClass('active'); //removes class active from all of them
    $('.tab').css('display', 'none'); //removes info from all of them
    // $('.tab').hide();
    $('li:nth-child(' + num + ' )').addClass('active'); //clicked tab to active
    $('#tab' + num).css('display', 'block'); //add info to tab
    // $('#tab' + num).show();
  });
});