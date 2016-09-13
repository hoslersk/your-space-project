$(document).ready(function() {

  venCalendar();
});

function venCalendar() {
  if ($('#calendar_ven').length > 0) {
    $('#calendar_ven').fullCalendar({
      events: `/venues/${$('div#calendar_ven')[0].getAttribute("data-ven-id")}.json`


    });



  }
}

var form = function(view) {

  $('span:contains("Not Available")').parent().parent().animate({
    top: '-20px'
  })

  $('span:contains("Not Available")').parent().parent().css('z-index', 9999)

  $('span:contains("Not Available")').parent().parent().css(
    "background-color",
    "red")

  format()
}

form()

function format() {

  $('span:contains("Not Available")').parent().parent().animate({
    top: '-20px'
  })

  $('span:contains("Not Available")').parent().parent().css('z-index', 9999)

  $('span:contains("Not Available")').parent().parent().css("background-color",
    "red")
}
