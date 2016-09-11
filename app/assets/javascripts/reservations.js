$(document).ready(function() {
  $('#calendar_res').fullCalendar({
    events: '/reservations.json'
  });
});
