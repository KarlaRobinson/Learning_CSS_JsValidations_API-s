$(document).ready(function() {
	$('#start_btn').on("click", function(){

    three();
    setTimeout(two, 500);
    setTimeout(one, 1000);
    setTimeout(go, 1500);
    setTimeout(move, 2000);
  });

  function move(){
    td = $('tr').find('td.active')
    $(td).removeClass('active');
    $(td).next().addClass('active');
    // if (td === $('#'+ player).find('td.finnish')) { break; }
    setTimeout(move, 50);
  };

  // function intro(){
  //   if (num == 0){
  //     move();
  //   } else {
  //   $("#count").text(num);
  //   num--
  //   setTimeout(intro, 3000);
  //   }

  function three(){
    $("#count").text(3);
  };

  function two(){
    $("#count").text(2);
  };

  function one(){
    $("#count").text(1);
  };

  function go(){
    $("#count").text("Go!");
  };

  // for(var i=3; i > 0; i--){
  //   $("#count").text(i);
  //   setTimeout(for, 500);
  // }
  //   $("#count").text("Go!");
  //   move();
  // };


  //   $(document).on('keyup', function(event) {
  //   // Detecta cual tecla fue presionada y llama al método o función apropiada.
  //   });


  // $( "#start_btn" ).click(function() {
  //   td = $('#Player1').find('td.active')
  //   $('#Player1 td').removeClass('active');
  //   next = (td).next()
  //   $(td).animate({
  //     $(this).addClass('active');
  //   }, 500, function() {
  //     // Animation complete.
  //   });
  // });
});
