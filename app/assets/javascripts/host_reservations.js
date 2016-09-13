$(document).ready(function() {
  $('#calendar_res_h').fullCalendar({
    events: '/host_reservations.json'
  });
});
