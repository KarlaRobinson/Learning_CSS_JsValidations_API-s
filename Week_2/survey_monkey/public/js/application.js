$(document).ready(function() {
  var counterQ = 0;
  var counterOp = 0;

  $('#start').on("click", function(){
    start();
  });

  $('.container').on("click", '#nxt_q', function(){
    addQ();
  });

  // $(".container").find('#nxt_op').on("click", function(){
  $('.container').on('click', '#nxt_op', function(){
    addOp();
  });

  function start(){
    var newdiv = document.createElement('div');
    newdiv.innerHTML = "Question " + (counterQ + 1) + " <br><input type='text' name=question" + (counterQ + 1) + ">";
    document.getElementById('dynamicInput').appendChild(newdiv);
    counterQ++;

    var name = $("form > input[name=name]").val();
    $("form > input[name=name]").replaceWith("<p id=" + name + ">" + name + "</p>");
    $('#start').replaceWith("<br><input id='nxt_op' type='button' name='nxt_op' value='AddOption'>");
  }

  function addOp(){
            var newdiv = document.createElement('div');
            newdiv.innerHTML = "<br>("+ (counterOp + 1) + ")<input type='text' name=option" + counterQ + "" + (counterOp + 1) + ">";
            document.getElementById('dynamicInput').appendChild(newdiv);

       if (counterOp == 2)  {
            var option = $("input[name=option" + counterQ + "" + counterOp + "]").val()
            $("input[name=option" + counterQ + "" + counterOp + "]").replaceWith("<p id=option" + counterQ + "" + counterOp + ">" + option + "</p>");

            $('#nxt_op').replaceWith("<br><input id ='nxt_q' type='button' name='nxt_q' value='AddQuestion'>");
            counterOp = 0;
       }
       else if (counterOp == 1) {
            var option = $("input[name=option" + counterQ + "" + counterOp + "]").val()
            $("input[name=option" + counterQ + "" + counterOp + "]").replaceWith("<p id=option" + counterQ + "" + counterOp + ">" + option + "</p>");
            counterOp++;
       }
       else {
            var question = $("input[name=question" + counterQ + "]").val()
            $("input[name=question" + counterQ + "]").replaceWith("<p id=question" + counterQ + ">" + question + "</p>");
            counterOp++;
       }
  }

  function addQ(){
       if (counterQ == 3)  {
            alert("You have reached the limit of adding " + counterQ + " questions");
       }
       else {
            var newdiv = document.createElement('div');
            newdiv.innerHTML = "Question " + (counterQ + 1) + " <br><input type='text' name=question" + (counterQ + 1) + ">";
            document.getElementById('dynamicInput').appendChild(newdiv);

            var question = $("input[name=question" + counterQ + "]").val()
            $("input[name=question" + counterQ + "]").replaceWith("<p id=question" + counterQ + ">" + question + "</p>");

            counterQ++;
       }
  }
});

//input[name=btn1]