$(document).ready(function() {

  placeCalendar();
});

function placeCalendar() {
  if ($('#calendar_lis').length > 0) {
    $('#calendar_lis').fullCalendar({
      events: `/listings/${$('div#calendar_lis')[0].getAttribute("data-listing-id")}.json`
    });
  }
}
