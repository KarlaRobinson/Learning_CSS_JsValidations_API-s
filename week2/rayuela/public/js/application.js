$(document).ready(function() {
	$('#start_btn').on("click", function(){
    intro();
  });

  var num = 3;
  var p1_advance;
  var p2_advance;
  var finish = 0;

  function intro(){
    if (num == 0){
      $("#count").text("Empieza!");
      move1();
      move2();
      // num = 3;
    } else {
      // $('td').removeClass('active');
      // $('#p1_1').addClass('active');
      // $('#p2_1').addClass('active');
      $("#count").text(num);
      num--;
      setTimeout(intro, 1000);
    };
  };

  function move1(){
    td = $('#Player1').find('td.active')
    if (td.is('#p1_100')) {
      finish++;
      result();
    } else {
      $(td).removeClass('active');
      $(td).next().addClass('active');
      p1_advance = setTimeout(move1, 50);
    }
  };


  function move2(){
    td = $('#Player2').find('td.active')
    if (td.is('#p2_100')) {
      finish++;
      result();
    } else {
      $(td).removeClass('active');
      $(td).next().addClass('active');
      p2_advance = setTimeout(move2, 50);
    }
  };




  $(document).keypress(function(e){
    if(e.which == 102){
      clearTimeout(p1_advance);
      finish++;
      result();
    }
    if(e.which == 106){
      clearTimeout(p2_advance);
      finish++;
      result();
    }
  });

  function result(){
    p1_loc = parseInt($('#Player1').find('td.active').attr('id').slice(3));
    p2_loc = parseInt($('#Player2').find('td.active').attr('id').slice(3));

    if (p1_loc == 100 && p2_loc == 100) {
      $("#result").text("Se estaban comiendo los mocos..");
      $.post( '/stats', "data=0");
    };

    if (finish == 2) {
      if (p1_loc == p2_loc) {
        $("#result").text("Apa, un empate!");
        $.post( '/stats', "data=0");
      } else if (Math.abs(90 - p1_loc) > Math.abs(90 - p2_loc)) {
        $("#result").text("Jugador 2 es el ganador!!");
        $('#Player2').addClass('active')
        $.post( '/stats', "data=2");
      } else {
        $("#result").text("Jugador 1 es el ganador!!");
        $('#Player1').addClass('active')
        $.post( '/stats', "data=1");
      };
    };
  };
});

















