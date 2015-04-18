$(function() {
  function initialize() {
    var mapOptions = {
      center: { lat: centerLocation.latitude, lng: centerLocation.longitude },
      zoom: 13
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
  }

  google.maps.event.addDomListener(window, 'load', initialize);
});
