// $(window).load(function() {
//
//     // codeVenueMarkersDefaults($(".venue-name"),$(".zip-code"))
//
//
//     $(document).ajaxSuccess(function(event, data, settings) {
//         $(function() {
//             venues = data.responseJSON.venues
//             venueResultsHtml = ""
//                 // var searchInput = $('#someAddress').val()
//             for (var i = 0; i < venues.length; i++) {
//                 venueResultsHtml += `<div id="venue-results">
//             <a href="/venues/${venues[i].id}"><img src="${venues[i].image_url}"></a><br>
//             <strong><a href="/venues/${venues[i].id}">${venues[i].name}</a></strong><br>
//             Street: ${venues[i].address}<br>
//             City, Zip Code: ${venues[i].city}, ${venues[i].zip_code}<br>
//               Available Dates: <li>${venues[i].listings[0].available_start_date} - ${venues[i].listings[0].available_end_date}
//               <br>Price Per Day: $${venues[i].listings[0].price} </li><br>
//             </div>`
//             }
//             $('#search-results').html(venueResultsHtml)
//             data = data.responseJSON
//             codeVenueMarkers(data)
//         })
//     })
//
//     var geocoder;
//     var map;
//     var venueLat;
//     var venueLng;
//     var data;
//
//     function initialize() {
//         //Set the geocoder variable equal to an instance of the google maps geocoder object as new google.maps.Geocoder()
//         geocoder = new google.maps.Geocoder();
//         var latlng = new google.maps.LatLng(40.748713, -73.985675);
//         var myOptions = {
//             zoom: 12,
//             center: latlng,
//             mapTypeId: google.maps.MapTypeId.ROADMAP,
//             styles: [{
//                 "featureType": "landscape.natural",
//                 "elementType": "geometry.fill",
//                 "stylers": [{
//                     "visibility": "on"
//                 }, {
//                     "color": "#e0efef"
//                 }]
//             }, {
//                 "featureType": "poi",
//                 "elementType": "geometry.fill",
//                 "stylers": [{
//                     "visibility": "on"
//                 }, {
//                     "hue": "#1900ff"
//                 }, {
//                     "color": "#c0e8e8"
//                 }]
//             }, {
//                 "featureType": "road",
//                 "elementType": "geometry",
//                 "stylers": [{
//                     "lightness": 100
//                 }, {
//                     "visibility": "simplified"
//                 }]
//             }, {
//                 "featureType": "road",
//                 "elementType": "labels",
//                 "stylers": [{
//                     "visibility": "off"
//                 }]
//             }, {
//                 "featureType": "transit.line",
//                 "elementType": "geometry",
//                 "stylers": [{
//                     "visibility": "on"
//                 }, {
//                     "lightness": 700
//                 }]
//             }, {
//                 "featureType": "water",
//                 "elementType": "all",
//                 "stylers": [{
//                     "color": "#7dcdcd"
//                 }]
//             }]
//         };
//         map = new google.maps.Map(document.getElementById("map-canvas"),
//             myOptions);
//     }
//
//
//     initialize('#map-container');
//
//
//     //Add a second function to your javascript code, call it codeAddress.  It will not have any values passed to it.
//     // function codeAddress() {
//     //   debugger;
//     //     var myPlace;
//     //
//     //     //The first line of the function should use getElementById to get the address from the text box and place it into a variable we'll call sAddress.
//     //     var sAddress = document.getElementById("inputTextAddress").value;
//     //     //Call the geocode method of the geocoder object, this will take two passed in parameters.  The first is the GeocoderRequest, this says what kind of request is being made and what the request value is. The second is the callback function that will be used to process the results.
//     //     geocoder.geocode({
//     //         'address': sAddress
//     //     }, function(results, status) {
//     //         //The callback function should first check the status value of the callback function.  Use an IF statement to test the result, check to see if the status equal google.maps.GeocoderStatus.OK.  Also add an ELSE clause to the if statement as well.
//     //         if (status == google.maps.GeocoderStatus.OK) {
//     //
//     //             //If the status equals OK, call the setCenter method of the map object variable.  You will pass this method the results first geometry location.
//     //             map.setCenter(results[0].geometry.location);
//     //             //Next use the same result geometry location to add a map marker to the map object variable.  Create a new variable, we'll call it oMarker, it will be created as a new google.maps.Marker.  The new method take two paramaters, the first is the map object that you're adding the marker to, and the second is the position to place the marker which is again the first results geometry location.
//     //             myPlace.lat = results[0].geometry.location.lat();
//     //             myPlace.lng = results[0].geometry.location.lng();
//     //         } else {
//     //             alert("Geocode was not successful for the following reason: " + status);
//     //         }
//     //     });
//     // }
//
//     // function codeVenueMarkersDefaults(venueNames,zipCodes) {
//     //
//     //     var newYorkLat = 40.748713
//     //     var newYorkLng = -73.985675
//     //     for (var i = 0; i < venueNames.length; i++) {
//     //         var sAddress = zipCodes[i].innerHTML
//     //         var name = venueNames[i].innerHTML
//     //         geocoder.geocode({
//     //           debugger;
//     //             'address': sAddress
//     //         }, function(results, status) {
//     //             if ("OK" == google.maps.GeocoderStatus.OK) {
//     //                 venueLat = results[0].geometry.location.lat()
//     //                 venueLng = results[0].geometry.location.lng()
//     //                 if ((Math.round(venueLat) === Math.round(newYorkLat)) && (Math.round(venueLng) === Math.round(newYorkLng))) {
//     //                     var contentString = `<h3> ${name} </h3>`
//     //                     var infoWindow = new google.maps.InfoWindow({
//     //                         content: contentString
//     //                     });
//     //                     var marker = new google.maps.Marker({
//     //                         map: map,
//     //                         position: results[0].geometry.location,
//     //                         title: name
//     //                     });
//     //
//     //                     marker.addListener('click', function() {
//     //                         infoWindow.open(map, marker);
//     //                     });
//     //                 }
//     //
//     //             } else {
//     //                 alert("Geocode was not successful for the following reason: " + status);
//     //             }
//     //         });
//     //     }
//     // }
//
//     function codeVenueMarkers(data) {
//         debugger;
//         //function codeAddress(data)
//         //The first line of the function should use getElementById to get the address from the text box and place it into a variable we'll call sAddress.
//         var sAddress = data.searchInput;
//         var myPlace = {}
//             //Call the geocode method of the geocoder object, this will take two passed in parameters.  The first is the GeocoderRequest, this says what kind of request is being made and what the request value is. The second is the callback function that will be used to process the results.
//         geocoder.geocode({
//                 'address': sAddress
//             },
//             function(results, status) {
//                 //The callback function should first check the status value of the callback function.  Use an IF statement to test the result, check to see if the status equal google.maps.GeocoderStatus.OK.  Also add an ELSE clause to the if statement as well.
//                 if (status == google.maps.GeocoderStatus.OK) {
//                     //If the status equals OK, call the setCenter method of the map object variable.  You will pass this method the results first geometry location.
//                     map.setCenter(results[0].geometry.location);
//                     //Next use the same result geometry location to add a map marker to the map object variable.  Create a new variable, we'll call it oMarker, it will be created as a new google.maps.Marker.  The new method take two paramaters, the first is the map object that you're adding the marker to, and the second is the position to place the marker which is again the first results geometry location.
//                     myPlace.lat = results[0].geometry.location.lat();
//                     myPlace.lng = results[0].geometry.location.lng();
//                     makeMarkers(data);
//                 } else {
//                     //Finally we're going to add an alert message to the ELSE to let the user know that the Geocode didn't work like it should have.  You can use the status to give a bit more information rather than just saying that it didn't work.
//                     alert("Geocode was not successful for the following reason: " + status);
//                 }
//             });
//     }
//
//
//     function makeMarkers(data) {
//         var markers = []
//         var infoWindows = []
//
//         debugger;
//         for (var i = 0; i < data.venues.length; i++) {
//             var sAddress = data.venues[i].zip_code
//             var name = data.venues[i].name
//             var contentString = `<h3> ${name} </h3>`;
//             // var index = i
//             geocoder.geocode({
//                 'address': sAddress
//             }, function(results, status) {
//                 if (status == google.maps.GeocoderStatus.OK) {
//                     venueLat = results[0].geometry.location.lat()
//                     venueLng = results[0].geometry.location.lng()
//                 }
//
//                 debugger;
//                 markers[i] = new google.maps.Marker({
//                     map: map,
//                     position: results[0].geometry.location,
//                     title: name
//                 });
//                 infoWindows[i] = new google.maps.InfoWindow({
//                     content: contentString
//                 });
//                 markers[i].addListener('click', function() {
//                     infoWindows[i].open(map, markers[i]);
//                 })
//             })
//         }
//     }
//
// })
//
// // if ((Math.round(venueLat) == Math.round(myPlace.lat)) && (Math.round(venueLng) == Math.round(myPlace.lng))) {
// //    var contentString = `<h3> ${name} </h3>`;
// //    var infoWindow = new google.maps.InfoWindow({
// //       content: contentString
// //    });
// //    var markers = new google.maps.Marker({
// //       map: map,
// //       position: results[0].geometry.location,
// //       title: name,
// //       // id: i
// //    });
// //    markers.addListener('click', function() {
// //    infoWindow.open(map, markers);
// //    map.panTo(markers.getPosition());
// //
// //    });
// // }
// // else {
// //     alert("Geocode was not successful for the following reason: " + status);
// // }
// //         }
// //       )};
// //       }
// //   }
// // })
