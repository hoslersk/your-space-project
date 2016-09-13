//Declare the variable that will store the geocode object
var geocoder;
var map;
var venueLat;
var venueLng;

$(window).load(function() {
        $.ajax({
            method: 'GET',
            url: "/venueinfo",
            dataType: 'json', //required to hit   below (matching request and response formats here and in controller's 'respond_to')
            success: codeVenueMarkersDefaults
        })
        $("#search-submit").click(function() {
            var searchInput = $('#someAddress').val()
            console.log("you clicked submit")
            $.ajax({
                data: {
                    searchInput: searchInput
                },
                method: 'GET',
                url: "/venueinfo",
                dataType: 'json',
                success: codeVenueMarkers
            })
        });

        //moving me outside makes the map not reload at all based on search input


        initialize('#map-container');
        //Add a second function to your javascript code, call it codeAddress.  It will not have any values passed to it.


    })
    //line above is where window.load ends

function makeMarkers() {
    var markers = []
    for (var i = 0; i < data.venues.length; i++) {
        var sAddress = data.venues[i].zip_code
        var name = data.venues[i].name
        geocoder.geocode({
            'address': sAddress
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                venueLat = results[0].geometry.location.lat()
                venueLng = results[0].geometry.location.lng()

                if ((Math.round(venueLat) == Math.round(myPlace.lat)) && (Math.round(venueLng) == Math.round(myPlace.lng))) {
                    var contentString = `<h3> ${name} </h3>`;
                    var infoWindow = new google.maps.InfoWindow({
                        content: contentString
                    });
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location,
                        title: name
                    });
                    marker.addListener('click', function() {
                        infoWindow.open(map, marker);
                    });
                }

            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }
}

function codeVenueMarkersDefaults(data) {
    var newYorkLat = 40.748713
    var newYorkLng = -73.985675
    for (var i = 0; i < data.venues.length; i++) {
        var sAddress = data.venues[i].zip_code
        var name = data.venues[i].name
        geocoder.geocode({
            'address': sAddress
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                venueLat = results[0].geometry.location.lat()
                venueLng = results[0].geometry.location.lng()
                if ((Math.round(venueLat) === Math.round(newYorkLat)) && (Math.round(venueLng) === Math.round(newYorkLng))) {
                    var contentString = `<h3> ${name} </h3>`
                    var infoWindow = new google.maps.InfoWindow({
                        content: contentString
                    });
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location,
                        title: name
                    });

                    marker.addListener('click', function() {
                        infoWindow.open(map, marker);
                    });
                }

            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }
}

function codeAddress() {
    console.log("codeaddress was called")
    var myPlace;
    //The first line of the function should use getElementById to get the address from the text box and place it into a variable we'll call sAddress.
    var sAddress = document.getElementById("someAddress").value;
    //Call the geocode method of the geocoder object, this will take two passed in parameters.  The first is the GeocoderRequest, this says what kind of request is being made and what the request value is. The second is the callback function that will be used to process the results.
    geocoder.geocode({
        'address': sAddress
    }, function(results, status) {
        //The callback function should first check the status value of the callback function.  Use an IF statement to test the result, check to see if the status equal google.maps.GeocoderStatus.OK.  Also add an ELSE clause to the if statement as well.
        if (status == google.maps.GeocoderStatus.OK) {
            //If the status equals OK, call the setCenter method of the map object variable.  You will pass this method the results first geometry location.
            map.setCenter(results[0].geometry.location);
            //Next use the same result geometry location to add a map marker to the map object variable.  Create a new variable, we'll call it oMarker, it will be created as a new google.maps.Marker.  The new method take two paramaters, the first is the map object that you're adding the marker to, and the second is the position to place the marker which is again the first results geometry location.
            myPlace.lat = results[0].geometry.location.lat();
            myPlace.lng = results[0].geometry.location.lng();
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

function initialize() {
    console.log("initialize method was called.")
        //Set the geocoder variable equal to an instance of the google maps geocoder object as new google.maps.Geocoder()
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(40.748713, -73.985675);
    var myOptions = {
        zoom: 12,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: [{
            "featureType": "landscape.natural",
            "elementType": "geometry.fill",
            "stylers": [{
                "visibility": "on"
            }, {
                "color": "#e0efef"
            }]
        }, {
            "featureType": "poi",
            "elementType": "geometry.fill",
            "stylers": [{
                "visibility": "on"
            }, {
                "hue": "#1900ff"
            }, {
                "color": "#c0e8e8"
            }]
        }, {
            "featureType": "road",
            "elementType": "geometry",
            "stylers": [{
                "lightness": 100
            }, {
                "visibility": "simplified"
            }]
        }, {
            "featureType": "road",
            "elementType": "labels",
            "stylers": [{
                "visibility": "off"
            }]
        }, {
            "featureType": "transit.line",
            "elementType": "geometry",
            "stylers": [{
                "visibility": "on"
            }, {
                "lightness": 700
            }]
        }, {
            "featureType": "water",
            "elementType": "all",
            "stylers": [{
                "color": "#7dcdcd"
            }]
        }]
    };
    map = new google.maps.Map(document.getElementById("map-canvas"),
        myOptions);
}

//moving me outside window.load makes the map not reload to the new search input address
function codeVenueMarkers(data) {
    console.log("codeVenueMarkers was called")
    var sAddress = data.searchInput;
    var myPlace = {}
    geocoder.geocode({
        'address': sAddress
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            myPlace.lat = results[0].geometry.location.lat();
            myPlace.lng = results[0].geometry.location.lng();
            makeMarkers();
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}
