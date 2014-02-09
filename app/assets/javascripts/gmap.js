var MapView = {
  init: function() {
    var mapOptions = {
      center: new google.maps.LatLng(-34.397, 150.644),
      zoom: 10,
      maxZoom: 15,
      minZoom: 2,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: style,
      disableDefaultUI: true,
      scaleControlOptions: {
      }
    };

this.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

$(document).ready(function(){
  MapView.init(); 
}