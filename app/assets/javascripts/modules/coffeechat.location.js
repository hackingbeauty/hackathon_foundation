CoffeeChat.Location = {
  map: null,
  init: function(){
    this.getLocation();
  },
  testCoords: {
    latitude: 47.624851,
    longitude: -122.52099 
  },
  getLocation: function(){
    var self = this;
    if (Modernizr.geolocation) {
      navigator.geolocation.getCurrentPosition(self.logLocation,self.logLocationError);
    } else {
      alert("Your Browser does not support GeoLocation.");
    }
  },
  logLocation: function(position){
    var that = CoffeeChat.Location;
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    $.cookie('coordinates', JSON.stringify({
      'latitude':latitude,
      'longitude':longitude
    }));
    // var km = that.computeDistance(position.coords, that.testCoords);
    //that.drawMap(position.coords);
  },
  logLocationError: function(error){
    var errorTypes = {
      0: 'Unknown error',
      1: 'Permission denied by user',
      2: 'Position is not available',
      3: 'Request timed out'
    }
    var errorMessage = errorTypes[error.code];
  },
  computeDistance: function(startCoords,destCoords){
    var startLatRads = this.degreesToRadians(startCoords.latitude);
    var startLongRads = this.degreesToRadians(startCoords.longitude);
    var destLatRads = this.degreesToRadians(destCoords.latitude);
    var destLongRads = this.degreesToRadians(destCoords.longitude);

    var RADIUS = 6371; // radius of the Earth in km
    var distance = Math.acos(Math.sin(startLatRads) * Math.sin(destLatRads) +
                   Math.cos(startLatRads) * Math.cos(destLatRads) *
                   Math.cos(startLongRads = destLongRads)) * RADIUS;

    return distance; 
  },
  degreesToRadians: function(degrees){
    var radians = (degrees * Math.PI)/180;
    return radians;
    
  },
  drawMap: function(coords){
    var googleLatLng = new google.maps.LatLng(coords.latitude,
                                               coords.longitude);
    var mapOptions = {
      zoom: 10,
      center: googleLatLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }        
    var mapDiv = document.getElementById('map');
    this.map = new google.maps.Map(mapDiv, mapOptions);
  }
}
    

