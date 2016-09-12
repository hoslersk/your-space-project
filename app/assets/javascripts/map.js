// $(document).ready(retrieve_venues())
//
// function retrieve_venues() {
//   $.ajax({
//     type: "GET",
//     url:  "/venues",
//
//     success: function(data) {
//       //load the response from radar#index into the div (or any other element
//       console.log(data)
//       $("#my_div").html(data);
//       debugger;
//     }
//   });
// }

// $(document).ready(function() {
//   # map Ajax success function
//   mapAjaxSuccessListener()
// })
//
// function mapAjaxSuccessListener() {
//   $()
// }

$(document).ready(function(){
  debugger;
  // event.stopPropagation();
      // event.preventDefault();
      // var url = $(this).attr('href')
      // var pictureID = $(this).find($("div[picture_id]")).attr("picture_id");
      $.ajax({
        method: 'GET',
        url: "/venueinfo",
        dataType: 'json', //required to hit debugger below (matching request and response formats here and in controller's 'respond_to')
        success: function(data) {
          // 1. Where does data come from?
          // 2. What does it look like/what does it contain?
          // debugger;
        },
        failure: function() {
          console.log(`You fail at everything`)
        }
      })
})

// Step 5: After successful hit on controller's binding.pry/byebug, test 'success'
// function addLikeButtonListener() {
//   $('a.like_button').on('click', function(event){
//     debugger;
//     event.stopPropagation();
//     event.preventDefault();
//     var url = $(this).attr('href')
//     var pictureID = $(this).find($("div[picture_id]")).attr("picture_id");
//     $.ajax({
//       method: 'POST',
//       url: url,
//       dataType: 'json', //required to hit debugger below (matching request and response formats here and in controller's 'respond_to')
//       success: function(data) {
//         // 1. Where does data come from?
//         // 2. What does it look like/what does it contain?
//         debugger;
//         $("[picture_id=" + pictureID + "] span").attr("class", data.heart_class) // "[brackets in quotes call on custom id/class-thing in tag]"
//         $("#likes-message-" + pictureID).html(data.likes_message)
//       }
//     })
//   })
// }
  //ajax request
  // function()
  // event.preventDefault();

  //Declare the variable that will store the geocode object
  // var geocoder;
  // var map;
  // var venueLat;
  // var venueLng;
  // function initialize() {
  //   //Set the geocoder variable equal to an instance of the google maps geocoder object as new google.maps.Geocoder()
  //   geocoder = new google.maps.Geocoder();
  //   var latlng = new google.maps.LatLng(40.748713, -73.985675);
  //   var myOptions = {
  //     zoom: 12,
  //     center: latlng,
  //     mapTypeId: google.maps.MapTypeId.ROADMAP,
  //     styles:[{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#e0efef"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"hue":"#1900ff"},{"color":"#c0e8e8"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"visibility":"on"},{"lightness":700}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#7dcdcd"}]}]
  //   };
  //   map = new google.maps.Map(document.getElementById("map-canvas"),
  //       myOptions);
  // }
  //
  //
  // initialize('#map-container');
  // var myPlace = {};
  // //Add a second function to your javascript code, call it codeAddress.  It will not have any values passed to it.
  // function codeAddress() {
  //   //The first line of the function should use getElementById to get the address from the text box and place it into a variable we'll call sAddress.
  //   var sAddress = document.getElementById("inputTextAddress").value;
  //   //Call the geocode method of the geocoder object, this will take two passed in parameters.  The first is the GeocoderRequest, this says what kind of request is being made and what the request value is. The second is the callback function that will be used to process the results.
  //   geocoder.geocode( { 'address': sAddress}, function(results, status) {
  //       //The callback function should first check the status value of the callback function.  Use an IF statement to test the result, check to see if the status equal google.maps.GeocoderStatus.OK.  Also add an ELSE clause to the if statement as well.
  //       if (status == google.maps.GeocoderStatus.OK) {
  //           //If the status equals OK, call the setCenter method of the map object variable.  You will pass this method the results first geometry location.
  //           map.setCenter(results[0].geometry.location);
  //           //Next use the same result geometry location to add a map marker to the map object variable.  Create a new variable, we'll call it oMarker, it will be created as a new google.maps.Marker.  The new method take two paramaters, the first is the map object that you're adding the marker to, and the second is the position to place the marker which is again the first results geometry location.
  //           myPlace.lat = results[0].geometry.location.lat();
  //           myPlace.lng = results[0].geometry.location.lng();
  //       } else {
  //           //Finally we're going to add an alert message to the ELSE to let the user know that the Geocode didn't work like it should have.  You can use the status to give a bit more information rather than just saying that it didn't work.
  //           alert("Geocode was not successful for the following reason: " + status);
  //       }
  //     });
  // }
  //
  // function codeVenueMarkers() {
  //   let zipCodes = []
  //   zipCodes = <%=raw @venue_zips %>
  //   let venueNames = []
  //   venueNames = <%=raw @venue_names %>
  //   for (var i=0; i < zipCodes.length;i++){
  //     debugger;
  //
  //         var sAddress = zipCodes[i];
  //         var name = venueNames[i];
  //         console.log(i)
  //
  //         geocoder.geocode( { 'address': sAddress}, function(results, status) {
  //           console.log(`just inside geocoder.geocode: ${sAddress}`)
  //           debugger;
  //             if (status == google.maps.GeocoderStatus.OK) {
  //               venueLat = results[0].geometry.location.lat()
  //               venueLng = results[0].geometry.location.lng()
  //
  //               if ((Math.round(venueLat) == Math.round(myPlace.lat)) && (Math.round(venueLng) == Math.round(myPlace.lng))) {
  //                 var contentString = `<h3> ${name} </h3>`;
  //
  //                 var infoWindow = new google.maps.InfoWindow({
  //                   content: contentString
  //                 });
  //                 debugger;
  //                 var marker = new google.maps.Marker({
  //                     map: map,
  //                     position: results[0].geometry.location,
  //                     title: name
  //                 });
  //
  //                 marker.addListener('click', function() {
  //                   infoWindow.open(map, marker);
  //                 });
  //               }
  //
  //             } else {
  //                 alert("Geocode was not successful for the following reason: " + status);
  //             }
  //             console.log(`i'm outside the geocode if statement ${i}`)
  //
  //           });
  //           console.log(venueLat)
  //           console.log(venueLng)
  //         }
  // }
