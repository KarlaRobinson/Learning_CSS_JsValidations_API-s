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
          var newinput = "<input type='text' placeholder='Question " + (counterQ + 1) + "' id='last_input' name='question" + (counterQ + 1) + "'><ol type='a' id='olQ" + (counterQ + 1) + "'></ol>";
          $('#dynamicInput').append(newinput);
          counterQ++;
          counterSet++;

          //find name input and replace it with its value
          var input = $('#last_input').val();
          $('#last_input').replaceWith("<p id='name'>" + input + "</p>");

          //replace start button with a question button
          $('#start').replaceWith("<input id='nxt_op' type='button' name='nxt_op' value='AddOption'>");
  }

  function addOp(){
          //find last question input and replace it with its value
          var input = $('#last_input').val()

          $('#last_input').replaceWith("<li id='" + $('#last_input').attr('name') + "'>" + input + "</li>");

          //create new option input form and add to DOM
          var newinput = "<input type='text' placeholder='Option " + (counterOp + 1) + "' id='last_input' name='option" + counterQ + (counterOp + 1) + "'>";
          $("#dynamicInput #olQ" + counterQ + "").append(newinput);

          

         if (counterSet == 3 && counterOp == 2){
              //replace question button with a create button
              $('#nxt_op').replaceWith("<input id='create' type='submit' name='create' value='CreateMySurvey!'>");
         }
         else if (counterOp == 2)  {
              //replace option button with a question button
              $('#nxt_op').replaceWith("<input id ='nxt_q' type='button' name='nxt_q' value='AddQuestion'>");
              counterOp++;
         }
         else if (counterOp == 1) {

              counterOp++;
         }
         else {
              counterOp++;
         }
  }

  function addQ(){
          //find last option input and replace it with its value
          var option = $('#last_input').val()
              $('#last_input').replaceWith("<li id=" + $('#last_input').attr('name') + ">" + option + "</li>");
          counterOp = 0;

          //create new question input form and add to DOM
          console.log("here");
          var newinput = "<input type='text' placeholder='Question " + (counterQ + 1) + "' id='last_input' name='question" + (counterQ + 1) + "'><ol type='a' id='olQ" + (counterQ + 1) + "'></ol>";
          $('#dynamicInput').append(newinput);

          //replace question button with an option button
          $('#nxt_q').replaceWith("<input id='nxt_op' type='button' name='nxt_op' value='AddOption'>");
          counterQ++;
          counterSet++;
  }

});



$('.container').on("click", '#create', function(event){
    event.preventDefault();
    op11 = $('#option11').text()
    op12 = $('#option12').text()
    op13 = $('#option13').text()
    ques1 = $('#question1').text()

    op21 = $('#option21').text()
    op22 = $('#option22').text()
    op23 = $('#option23').text()
    ques2 = $('#question2').text()

    op31 = $('#option31').text()
    op32 = $('#option32').text()
    op33 = $('#option33').text()
    ques3 = $('#question3').text()

    name = $('#name').text()

    survey = {};

    survey.name = name
    survey.q1 = [ques1, op11, op12, op13];
    survey.q2 = [ques2, op21, op22, op23];
    survey.q3 = [ques3, op31, op32, op33];

    // console.log(survey);
    // console.log(survey.question);
    // console.log(survey.question.q1.options);
    $.post('/new/survey', survey, function(id){
        window.location.href = "/survey/" + id;
    });
});












