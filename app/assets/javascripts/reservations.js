$(document).ready(function() {
  $('#calendar_res_r').fullCalendar({
    events: '/reservations.json',
    eventRender: function(event, element, view) {
      if (event.description == "pending") {
        //apply your logic here, make changes to element.
        element.css('border', 'blue')
        element.css('background', 'blue');
      } else if (event.description == "confirmed") {
        element.css('border', 'green')
        element.css('background', 'green');
      }
    }
  });
});
