//= require jquery
//= require jquery_ujs
//= require foundation
//= require gmaps
//= require_tree .

$(document).foundation();

$(document).ready(function() {

    var map = new GMaps({
          div: '#map-canvas',
          lat: 42.360083,
          lng: -71.05888,
          zoom: 12
    });
    $('#myform').submit(function(e){
      debugger;
        e.preventDefault();
        GMaps.geocode({
              address: $('#address').val().trim(),
              callback: function(results, status){
                    if(status=='OK'){
                          var latlng = results[0].geometry.location;
                          map.setCenter(latlng.lat(), latlng.lng());
                          map.addMarker({
                                lat: latlng.lat(),
                                lng: latlng.lng()
                          });
                    }
              }
        });
    });
});

// var geocoder;
// var map;
// var marker;
// var infowindow = new google.maps.InfoWindow({size: new google.maps.Size(150,50)});
// function initialize () {
//   geocoder = new google.maps.Geocoder();
//   var latlng = new google.maps.LatLng(42.360083,-71.05888);
//   var mapOptions = {
//     zoom: 13,
//     center: latlng,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   }

//   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
//   google.maps.event.addListener(map, 'lookup', function () {
//       // debugger;
//     infowindow.close();
//   });
// }

// function geocodePosition(pos) {
//   geocoder.geocode({
//     latlng: pos
//   }, function(responses) {
//     if (responses && responses.length > 0) {
//       marker.formatted_address = responses[0].formatted_address;
//     } else {
//       marker.formatted_address = 'Cannot determine address at this location.';
//     }
//     infowindow.setContent(marker.formatted_address+"<br>coordinates: "+marker.getPosition().toUrlValue(6));
//     infowindow.open(map, marker);
//   });
// }

// function codeAddress() {
//   var address = document.getElementById('address').value;
//   geocoder.geocode( { 'address': address}, function(results, status) {
//     if (status == google.maps.GeocoderStatus.OK) {
//       map.setCenter(results[0].geometry.location);
//         if (marker) {
//           marker.setMap(null);
//           if (infowindow) infowindow.close();
//       }
//           marker = new google.maps.Marker({
//           map: map,
//                draggable: true,
//                position: results[0].geometry.location
//       });

//       google.maps.event.addListener(marker, 'dragend', function() {
//         geocodePosition(marker.getPosition());
//       });

//       google.maps.event.addListener(marker, 'click', function() {
//         if (marker.formatted_address) {
//           infowindow.setContent(marker.formatted_address+"<br>coordinates: "+marker.getPosition().toUrlValue(6));
//         } else  {
//           infowindow.setContent(address+"<br>coordinates: "+marker.getPosition().toUrlValue(6));
//         }
//         infowindow.open(map, marker);
//       });

//       google.maps.event.trigger(marker, 'click');
//     } else {
//       alert('Geocode was not successful for the following reason: ' + status);
//     }

//   });
// }

// function findLocation() {
//     var address = document.getElementById('address').value;
//     geocoder.geocode( { 'address': address}, function(results, status) {
//       if (status == google.maps.GeocoderStatus.OK) {
//         map.setCenter(results[0].geometry.location);
//         var marker = new google.maps.Marker({
//             map: map,
//             position: results[0].geometry.location
//         });
//       } else {
//         alert('Location not found: ' + status);
//       }
//     });
//   }



// var map = null;
//         $(document).ready(function () {
//             // // Set values for latitude and longitude
//             // var latitude = parseFloat("51.515252");
//             // var longitude = parseFloat("-0.189852");
//             // // Setup the Google map
//             // loadMap(latitude, longitude);
//             // // Add the marker
//             // setupMarker(latitude, longitude);
//             // // Setup the address lookup on the button click event
//             $('#lookup').click(function() {
//                 var address = $('#address').val();
//                 var geocoder = new google.maps.Geocoder();
//                 geocoder.geocode({ 'address': address }, function (results, status) {
//                     if (status == google.maps.GeocoderStatus.OK) {
//                         // Show the new position on the map
//                         setupMarker(results[0].geometry.location.lat(), results[0].geometry.location.lng())
//                     }
//                     else alert("Unable to get a result, reason: " + status);
//                 });
//             });
//         });
//         // Loads the maps
//         loadMap = function (latitude, longitude) {
//             var latlng = new google.maps.LatLng(latitude, longitude);
//             var myOptions = {
//                 zoom: 7,
//                 center: latlng,
//                 mapTypeId: google.maps.MapTypeId.ROADMAP
//             };
//             map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
//         }
//         // Setups a marker and info window on the map at the latitude and longitude specified
//         setupMarker = function(latitude, longitude) {
//             // Generate the position from the given latitude and longitude values
//             var pos = new google.maps.LatLng(latitude, longitude);
//             // Define the marker on the map in the specified location
//             var marker = new google.maps.Marker({
//                 position: pos,
//                 map: map,
//                 title: name
//             });
//             // Add a listener to this marker to display the information window on click
//             var info = "This is a marker for the following co-ordinates:<br />latitude: " + latitude + "<br/>longitude: " + longitude;
//             google.maps.event.addListener(marker, 'click', function () {
//                 var infowindow = new google.maps.InfoWindow({
//                     content: info
//                 });
//                 infowindow.open(map, marker);
//             });
//         }

// var marker;
// function createMarker(coords, map, title){
//   marker = new google.maps.Marker({
//     position: coords,
//     map: map,
//     title: title
//   });
// }

// function codeAddress(geocoding){
//   $('#lookup').click(function() {
//   var address = $("#search_box_geocoding").val();
//   if(address.length > 0){
//     geocoding.geocode({'address': address},function(results, status){
//       if(status == google.maps.GeocoderStatus.OK){
//         map.setCenter(results[0].geometry.location);
//         var marker = new google.maps.Marker({
//           map: map,
//           position: results[0].geometry.location
//         });
//       } else {
//         alert("Geocode was not successful for the following reason: " + status);
//       }
//     });
//   } else {
//     alert("Search field can't be blank");
//   }
//  })
// }
