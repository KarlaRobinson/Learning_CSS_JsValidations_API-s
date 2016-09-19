#Use the following basic selectors (element, id and class) to select 2 elements from the page. Use the funcion .css() to alter a property of these two elements

$(".section")
$(".section").css("color", "red")

$(".main-title").css("border", "10px solid red")

#use the basic selectors and the method .find() to select an image and change it for another

$("body").find("img")
$("body").find("img").attr("src", "http://cdn1-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-2.jpg");

#Use the traverse method to travel the Document Object Model and select all the instances of an element which repeats itself on the page and use the method animate() to modify them

$( "nav>ul>li" ).each(function( index ) {
  console.log( index + ": " + $( this ).text() );
});

$('.content').animate({marginLeft: '60%'});

$("nav>ul>li").animate({marginLeft: '60%'});


# Look for an element which must be reached through at least 3 selectors /
# traverse methods. Next used the method .on() to do a bind to a specific event which modifies this element


$( "nav>ul>li>a" ).on("click", function(){
  $(this).css("color", "red");
  });