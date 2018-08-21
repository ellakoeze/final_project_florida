// Geog 576: Final Project 

/*
 * 
 * List of features that need to be added and who is working on it 
 * 
 * Features
 * 1. View All POIS
 * -- UP AND RUNNING E.K. created initial project 
 * -- K.W. has icons picked out for different POIs. need to load in.  
 * 
 * 
 * 2. USER ADD THEIR OWN POI
 * -add marker feature will 
 * -- -- GUI NEEDED (Boot strap window)
 * -- -- Click and add marker with necessary info?
 * build on the Create Report and tweak it to 
 * Submit the landmark code
 * need to look into 
 * 
 * 
 * 3. TOGGLE POI ON/OFF
 * -- K.W. added toggle buttons to pane on homescreen, successful on\off toggle with layers added 08/07
 * --S.G. helping? kind of..
 * --collaborative effort: E.K., S.G., K.W.  * 
 * 
 * 4. USER SAVES PLACES THEY SELECT
 * -- https://stackoverflow.com/questions/28975015/google-maps-api-v3-0-saving-a-reference-to-a-marker // could hep to save markers user clicks
 * -- https://www.youtube.com/watch?v=q2VV3-yWupU
 * 
 * 5. USER EXPORTS THOSE SAVES PLACES 
 * --shoop baby shoop
 * -- best to take the array that it's in and export it as a csv 
 * -- -- https://medium.com/@danny.pule/export-json-to-csv-file-using-javascript-a0b7bc5b00d2
 * -- -- https://gist.github.com/dannypule/48418b4cd8223104c6c92e3016fc0f61 
 * 
 * 
 * GUI SHOULD have ability 
 * 
 * -- add info for marker
 * -- export JSON TO CSV 
 * 
 * 
 * 
 * */


var map;
var clickMarker;
var createLatLng;
var markers = [];

function initialization() {
	showLandMarks("all");
}

//function to select landmarks based on type (to be used on Filter map function below)
function showLandMarks(selType) {
  $.ajax({
    url: 'HttpServlet',
    type: 'POST',
    data: { "tab_id": "1", "type": selType},
    success: function(landmarks) { 
      mapInitialization(landmarks);
    },
    error: function(xhr, status, error) {
      alert("An AJAX error occured: " + status + "\nError: " + error);
    }
  });
} // end of showAllLandMarks

function mapInitialization(landmarks) {
	var mapOptions = { 
		mapTypeId : google.maps.MapTypeId.ROADMAP,
        center: {lat: 28.18, lng: -81.5158}, //correct 
        zoom: 10
		};// set the type of MAP	

	// Render the map within the empty div
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	var bounds = new google.maps.LatLngBounds ();

	//need to be filled in 
	var icons = {
			beaches: { icon:''},//img/image.png // file path once we decided the files  
			hotels: {icon:''},
			airports: { icon:''},
			nationalParks: {icon:''},
			shoppingCenters: { icon:''},
			campgrounds: {icon:''}
	  };//end of icon VAR

	//jquery function  
	$.each(landmarks, function(i, e) {
		var long = Number(e['longitude']);
		var lat = Number(e['latitude']);
		var type = e.type;
		//var landmarkType=e['type']; // landmarkType empty string should be the string in the name var in index.jsp 
		var latlng = new google.maps.LatLng(lat, long);     
		bounds.extend(latlng);
    
		//create the content window information if needed
		//add if loops to match the markers with the TYPE, NAME, Address??
		//
		// Create the infoWindow content
		//    var contentStr = '<h4>Report Details</h4><hr>';
		//    contentStr += '<p><b>' + 'Disaster' + ':</b>&nbsp' + e['disaster'] + '</p>';
		//    contentStr += '<p><b>' + 'Report Type' + ':</b>&nbsp' + e['report_type'] + 
		//      '</p>';
		//    if (e['report_type'] == 'request' || e['report_type'] == 'donation') {
		//      contentStr += '<p><b>' + 'Resource Type' + ':</b>&nbsp' + 
		//        e['resource_type'] + '</p>';
		//    }//end of if 
		//    else if (e['report_type'] == 'damage') {
		//      contentStr += '<p><b>' + 'Damage Type' + ':</b>&nbsp' + e['damage_type'] 
		//        + '</p>';
		//    }//end of else is
		//    //reporter 
		//    contentStr += '<p><b>' + 'Reporter' + ':</b>&nbsp' + e['first_name'] + '&nbsp' + e['last_name'] + '</p>';
		//    contentStr += '<p><b>' + 'Timestamp' + ':</b>&nbsp' + 
		//      e['time_stamp'].substring(0,19) + '</p>';
		//    if ('message' in e){
		//      contentStr += '<p><b>' + 'Message' + ':</b>&nbsp' + e['message'] + '</p>';
		//    }//end of if

		// Create the marker
		var marker = new google.maps.Marker({ // Set the marker
			position : latlng, // Position marker to coordinates
			//icon: icons[landmarkType].icon, //update icon image 
			map : map,
			type: type
			//customInfo: contentStr, //content strings in above in the commented code above 
		}); //end of marker VAR

		// Add a Click Listener to the marker
		google.maps.event.addListener(marker, 'click', function() { 
			// use 'customInfo' to customize infoWindow
			//infowindow.setContent(marker['customInfo']);
			infowindow.open(map, marker); // Open InfoWindow
		}); //end of google maps event listener
  
		markers.push(marker);
	
	});//end of JQUERY
	
	map.fitBounds (bounds); 
	

} //end of mapInitialization

function addMapMarker(button){
	
//	console.log(button.checked);
	
	if(button.checked){
		clearMap("all");
		document.getElementById("add-options").classList.add("active");
		document.getElementById("addMarker-text").innerHTML = "Hide";
        var onClick = map.addListener('click', function(e) {
            placeMarkerAndPanTo(e.latLng, map);
            createLatLng = e.latLng;
            google.maps.event.removeListener(onClick);
          });
        }
	else{
		document.getElementById("add-options").classList.remove("active");
		document.getElementById("addMarker-text").innerHTML = "Add landmark";
	}
	} //end of addMapMrker
	
	
function placeMarkerAndPanTo(latLng, map) {
	//console.log(marker.getPosition());
	if(clickMarker){
		//if marker already was created change positon
		clickMarker.setPosition(latLng);
		} else{
			clickMarker = new google.maps.Marker({
				animation: google.maps.Animation.DROP,
				position: latLng,
				draggable: true,
				map: map
				})
			
		}//end of else 

} // end of placeMarkerAndPanTo



//event listener on side bar
function filterMap(type, button){

	if(!button.checked){
		clearMap(type);
	}
	else if(button.checked){
		if(type == 'all'){
			document.getElementById("all-text").innerHTML= "Clear map";
			let buttons = document.getElementsByClassName("toggle");
			for (var i = 0; i < buttons.length; i++) {
		        buttons[i].checked = true;
		    }
			let labels = document.getElementsByClassName("btn-secondary");
			for (var i = 0; i < labels.length; i++) {
		        labels[i].classList.add("active");
		    }
		}
		
		
		// do ajax request
		$.ajax({
		    url: 'HttpServlet',
		    type: 'POST',
		    data: { "tab_id": "1", "type": type},
		    success: function(landmarks) { 
		    
		    //added function to call specific type that is selected from ShowLandMarks function above.
		    addToMap(landmarks);
		    },
		    error: function(xhr, status, error) {
		      alert("An AJAX error occured: " + status + "\nError: " + error);
		    }
		  });	
	}	
} //filterMap

function addToMap(landmarks){ 
	
	var currentBounds = map.getBounds();
	
	$.each(landmarks, function(i, e) {
	    var long = Number(e['longitude']);
	    var lat = Number(e['latitude']);
	    var type = e.type;
	    var latlng = new google.maps.LatLng(lat, long);  
	    
	    currentBounds.extend(latlng);
	   
	    var newMarker = new google.maps.Marker({ // Set the marker
	    	  position : latlng, // Position marker to coordinates
	    	  //icon: icons[landmarkType].icon, //update icon image 
	    	  map : map, 
	    	  type: type
	    	  //customInfo: contentStr, //content strings in above in the commented code above 
	    	}); 

	    	// Add a Click Listener to the marker
	    	google.maps.event.addListener(newMarker, 'click', function() { 
	    	  // use 'customInfo' to customize infoWindow
	    	  //infowindow.setContent(marker['customInfo']);
	    	  infowindow.open(map, marker); 
	    }); 
	    markers.push(newMarker);
	}); // end of jquery
	
	
} //addToMap



function clearMap(type){
	
	if(type == 'all'){
		$.each(markers, function(i,m){
			m.setMap(null);
		});
		markers = [];
		document.getElementById("all-text").innerHTML= "Show all";
		let buttons = document.getElementsByClassName("toggle");
		for (var i = 0; i < buttons.length; i++) {
	        buttons[i].checked = false;
	    }
		let labels = document.getElementsByClassName("btn-secondary");
		for (var i = 0; i < labels.length; i++) {
	        labels[i].classList.remove("active");
	    }
	}
	else{
		var rmMarkers = markers.filter(function(m){
			return m.type == type;
		});
	
		$.each(rmMarkers, function(i,m){
			m.setMap(null);
			var index = markers.indexOf(m);
			if(index>-1){
				markers.splice(index, 1);
			}
		});
	}
	

} //end of map clearMap

//id | name | type | lat | long | user_created | user_saved | notes 

function createReport(event){
	event.preventDefault();  // stop form from submitting normally
	var a=$("#add_landMarks_form").serializeArray(); //Create the array | ID needs to be lower case and use _ UGHHH
	a.push({name: "tab_id", value: "0"}); //add the tab_id to the array with a 0 value - indicating the landmark
	
	
	
	console.log(createLatLng) //this log is now working
	
	a.push({name: "tab_id", value: "0"});
	a.push({name: "latitude", value: latLng.geometry.location.lat()});
	a.push({name: "longitude", value: latLng.geometry.location.lng()});
	//key : value assigned to var a
	a=a.filter(function(item){return item.item !='';});
	//console.log(place)
	
	//AJAX POST
	$.ajax({ 
		url: 'HttpServlet',
		type: 'POST',
		data: a,  
		success: function(landmarks) {
			//console.log(landmarks)
			alert("Report submitted!"); //alert created
			document.getElementById("add_landMarks_form").reset(); //reset form 
			initialization(); // map re-populated with reports
			},
			error: function(xhr, status, error) {
				alert("Status: " + status + "\nError: " + error);
				}
	}); //end of AJAX POST 
	
} // end of createReport function 

$("#add_landMarks_form").on("submit",createReport);


google.maps.event.addDomListener(window, 'load', initialization);

