function initialize() {
  var mapOptions = {
    center: centerPos,
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);
