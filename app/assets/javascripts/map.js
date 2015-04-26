var centerLocation;
var sitterLocation;
var google;

$(function() {
  function initialize() {
    var mapOptions = {
      center: { lat: centerLocation.latitude, lng: centerLocation.longitude },
      zoom: 12
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    sitterLocation.forEach(function(sitter) {
      var marker = new google.maps.Marker({
          position: new google.maps.LatLng(sitter.latitude, sitter.longitude),
          map: map
      });
    });
  }

  google.maps.event.addDomListener(window, 'load', initialize);
});

$(document).ready(function(){
   $('#map-canvas').sticky({topSpacing:0});
});
