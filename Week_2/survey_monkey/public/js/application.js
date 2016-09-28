$(document).ready(function() {
  var counterQ = 0;
  var counterOp = 0;
  var counterSet = 0;

  $('#start').on("click", function(){
    start();
  });

  $('.container').on("click", '#nxt_q', function(){
    addQ();
  });

  $('.container').on('click', '#nxt_op', function(){
    addOp();
  });

  function start(){
          //create new question input form and add to DOM
          var newinput = "<input type='text' placeholder='Question " + (counterQ + 1) + "' id='last_input'><ol type='a' id='olQ" + (counterQ + 1) + "'></ol>";
          $('#dynamicInput').append(newinput);
          counterQ++;
          counterSet++;

          //find last_input and replace it with its value
          var input = $('#last_input').val();
          $('#last_input').replaceWith("<p id=" + input + ">" + input + "</p>");

          //replace start button with a question button
          $('#start').replaceWith("<input id='nxt_op' type='button' name='nxt_op' value='AddOption'>");
  }

  function addOp(){
          //create new option input form and add to DOM
          var newinput = "<input type='text' placeholder='Option" + (counterOp + 1) + "' name=option" + counterQ + "" + (counterOp + 1) + ">";
          $("#dynamicInput #olQ" + counterQ + "").append(newinput);

         if (counterSet == 3 && counterOp == 2){
              //find last option input and replace it with its value
              var option = $("input[name=option" + counterQ + "" + counterOp + "]").val()
              $("input[name=option" + counterQ + "" + counterOp + "]").replaceWith("<li id=option" + counterQ + "" + counterOp + ">" + option + "</li>");

              //replace question button with a create button
              $('#nxt_op').replaceWith("<input id='create' type='submit' name='create' value='CreateMySurvey!'>");
         }
         else if (counterOp == 2)  {
              //find last option input and replace it with its value
              var option = $("input[name=option" + counterQ + "" + counterOp + "]").val()
              $("input[name=option" + counterQ + "" + counterOp + "]").replaceWith("<li id=option" + counterQ + "" + counterOp + ">" + option + "</li>");

              //replace option button with a question button
              $('#nxt_op').replaceWith("<input id ='nxt_q' type='button' name='nxt_q' value='AddQuestion'>");
              counterOp++;
         }
         else if (counterOp == 1) {
              //find last option input and replace it with its value
              var option = $("input[name=option" + counterQ + "" + counterOp + "]").val()
              $("input[name=option" + counterQ + "" + counterOp + "]").replaceWith("<li id=option" + counterQ + "" + counterOp + ">" + option + "</li>");

              counterOp++;
         }
         else {
              //find last question input and replace it with its value
              var question = $('#last_input').val();
              $('#last_input').replaceWith("<li id=question" + counterQ + ">" + question + "</li>");
              counterOp++;
         }
  }

  function addQ(){
          //create new question input form and add to DOM
          console.log("here")
          var newinput = "<input type='text' placeholder='Question " + (counterQ + 1) + "' id='last_input'><ol type='a' id='olQ" + (counterQ + 1) + "'></ol>";
          $('#dynamicInput').append(newinput);

          //find last option input and replace it with its value
          var option = $("input[name=option" + counterQ + "" + (counterOp) + "]").val()
           $("input[name=option" + counterQ + "" + counterOp + "]").replaceWith("<li id=option" + counterQ + "" + counterOp + ">" + option + "</li>");
          counterOp = 0;

          //replace question button with an option button
          $('#nxt_q').replaceWith("<input id='nxt_op' type='button' name='nxt_op' value='AddOption'>");
          counterQ++;
          counterSet++;
  }
});