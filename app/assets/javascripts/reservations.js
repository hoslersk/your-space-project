$(document).ready(function() {
  $('#calendar_res_r').fullCalendar({
    events: '/reservations.json'
  });
});
