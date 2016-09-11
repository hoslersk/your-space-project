$(document).ready(function() {

  venCalendar();
  format();
});

function venCalendar() {
  if ($('#calendar_ven').length > 0) {
    $('#calendar_ven').fullCalendar({
      events: `/venues/${$('div#calendar_ven')[0].getAttribute("data-ven-id")}.json`


    });
  }
}

function format() {
  $('span:contains("Not Availble")').parent().parent().animate({
    top: '-20px'
  })

  $('span:contains("Not Availble")').parent().parent().css('z-index', 9999)

  $('span:contains("Not Availble")').parent().parent().css("background-color",
    "red")
}
