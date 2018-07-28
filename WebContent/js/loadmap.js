
var map;


function initialization() {
//  showAllLandMarks();
  mapInitialization('tk');
}

function showAllLandMarks() {
  $.ajax({
    url: 'HttpServlet',
    type: 'POST',
    data: { "tab_id": "1"},
    success: function(landmarks) { 
      mapInitialization(landmarks);
    },
    error: function(xhr, status, error) {
      alert("An AJAX error occured: " + status + "\nError: " + error);
    }
  });
}

function mapInitialization(landmarks) {
  var mapOptions = {
    mapTypeId : google.maps.MapTypeId.ROADMAPcenter, 
    center: {lat: -34.397, lng: 150.644},
    zoom: 8 	
  };
  
  // Render the map within the empty div
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  
//  var bounds = new google.maps.LatLngBounds ();
//  
//  $.each(landmarks, function(i, e) {
//    var long = Number(e['long']);
//    var lat = Number(e['lat']);
//    var latlng = new google.maps.LatLng(lat, long); 
//    
//    bounds.extend(latlng);
//
//    // Create the marker
//    var marker = new google.maps.Marker({ // Set the marker
//      position : latlng, // Position marker to coordinates
//      map : map, // assign the market to our map variable
//    });
//    
//  });
//  
//  map.fitBounds (bounds);

}


//Execute our 'initialization' function once the page has loaded.
google.maps.event.addDomListener(window, 'load', initialization);

