$(function() {
  function initialize() {
    var mapOptions = {
      center: { lat: center_location.latitude, lng: center_location.longitude },
      zoom: 13
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
  }

  google.maps.event.addDomListener(window, 'load', initialize);
});
