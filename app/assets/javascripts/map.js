$(function() {
  function initialize() {
    var mapOptions = {
      center: { lat: centerLocation.latitude, lng: centerLocation.longitude },
      zoom: 12
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    sitterMark = sitterLocation.forEach(function(sitter) {
      var marker = new google.maps.Marker({
          position: new google.maps.LatLng(sitter.latitude, sitter.longitude),
          map: map
      });
    });

    $("#search-sitter-container").on("click", ".sitter-profile", function() {
      map = new google.maps.Map(document.getElementById('map-canvas'));
      var laLatLng = new google.maps.LatLng(sitterLocation[0].latitude, sitterLocation[0].longitude);
        map.panTo(laLatLng);
        map.setZoom(15);
    });

  sitterMark;
  }

  google.maps.event.addDomListener(window, 'load', initialize);
});

$(document).ready(function(){
   $('#map-canvas').sticky({topSpacing:0});
});
