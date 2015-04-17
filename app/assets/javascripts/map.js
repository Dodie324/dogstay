// function initialize() {
//   var mapOptions = {
//     center: centerPos,
//     zoom: 8
//   };
//   var map = new google.maps.Map(document.getElementById('map-canvas'),
//       mapOptions);
// }
// google.maps.event.addDomListener(window, 'load', initialize);

//  function initialize() {
//         var mapOptions = {
//           center: { lat: -34.397, lng: 150.644},
//           zoom: 8
//         };
//         var map = new google.maps.Map(document.getElementById('map-canvas'),
//             mapOptions);
//       }

// google.maps.event.addDomListener(window, 'load', initialize);
//on page load pass global variable containing ajax info for search results
  //this can include coordinates
  //title
  //link to show page
//initialize map with default location showing general user area
//get coordinates from the address with google maps geolocation
//set new center of map
//iterate over json object
  // var sitter;
  // var map;
  // function initialize(location) {
  //   geocoder = new google.maps.Geocoder();
  //   debugger;
  //   var latlng = new google.maps.LatLng(<%= location.latitude %>, <%= location.longitude %>);
  //   var mapOptions = {
  //     zoom: 8,
  //     center: latlng
  //   }
  // }

$(function() {
  function initialize() {
    var mapOptions = {
      center: { lat: center_location.latitude, lng: center_location.longitude },
      zoom: 12
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
  }

  google.maps.event.addDomListener(window, 'load', initialize);
});
