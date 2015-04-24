var oneLocation;
var google;

$(function() {
  function initialize() {
    var mapOptions = {
      center: { lat: oneLocation.latitude, lng: oneLocation.longitude },
      zoom: 15
    };
    var map = new google.maps.Map(document.getElementById("map-canvas1"),
        mapOptions);

    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(
          oneLocation.latitude,
          oneLocation.longitude
          ),
        map: map
    });

    $("#search-sitter-container").on("click", ".sitter-profile", function() {
      map = new google.maps.Map(document.getElementById("map-canvas1"));
      var laLatLng = new google.maps.LatLng(
        oneLocation[0].latitude,
        oneLocation[0].longitude
        );
        map.panTo(laLatLng);
        map.setZoom(15);
    });
  }

  google.maps.event.addDomListener(window, "load", initialize);
});
