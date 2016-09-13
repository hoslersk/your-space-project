$(document).ready(function() {

 venCalendar();
});

function venCalendar() {
 if ($('#calendar_ven').length > 0) {
   $('#calendar_ven').fullCalendar({
     events: `/venues/${$('div#calendar_ven')[0].getAttribute("data-ven-id")}.json`,
     eventColor: '#81d8d0 ',
     eventAfterAllRender: function(view) {

       $('span:contains("Reserved")').parent().parent().css(
         "background-color",
         "red")

       $('span:contains("Reserved")').parent().parent().css({
         top: '-20px'
       })

       $('span:contains("Reserved")').parent().parent().css(
         'z-index', 9999)
     }

   });

 }
}




// http://stackoverflow.com/questions/15529244/fullcalendar-pass-view-start-data-to-ajax
