<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>The Florida Project</title>
  <!-- Custom styles -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="css/styles.css">

<!-- jQuery -->


 <!-- Google Map js libraries 29760d3ac55302c73ba7bcfcc8284fa9c402d51f-->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=YOURAPI&signed_in=true&libraries=places,visualization"></script>

<!-- 
=======
<<<<<<< HEAD
>>>>>>> parent of 29760d3... on clicking a box, run an ajax request
-->
</head>


<body>
<!-- Header (Navigation Bar) -->
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">Florida Vacation Planner</a>
</nav>

        
  <div class="container-fluid">
    <div class="row">
      <div class="sidebar col-xs-3">
        <!-- Tab Navis-->
        <ul class="nav nav-tabs">
        
          <li class="active"><a href="#query_landmarks" data-toggle="tab">Legend</a></li>
          <li><a href="#addLandmarks" data-toggle="tab">Add Landmark</a></li>
          
        </ul>
        <!-- Tab panes -->
        <div class="tab-content ">
         		 <!-- Create Legend Tab Panel -->
		          <div class="tab-pane active" id="query_landmarks">
		            <form id = "query_landmarks_form">
		           
		            <br></br>
		            	<div class="btn-group-toggle" data-toggle="buttons">
						  <label class="btn primary active">
						    <input type="checkbox" autocomplete="off" onchange="filterMap('all', this)" > 
						    <p id = "all-text">Clear map</p>
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="img/Airport-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" id="airport" onchange="filterMap('airport', this)"> Airport
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="img/Airport-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('amusement', this)"> Amusement
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input  class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('Beach', this)"> Beach
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('campground', this)"> Campground
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('golf_course', this)"> Golf Course
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('Hotel', this)"> Hotel
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('nationa_forest_fed_land', this)"> National Forest
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('national_park', this)"> National Park
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						    <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('shopping_center', this)"> Shopping Center
						  </label>
						</div>
						<div class="btn-group-toggle" data-toggle="buttons">
						  <img src="/img/beach-icon.png">
						  <label class="btn btn-secondary active">
						    <input class ="toggle" type="checkbox" autocomplete="off" onchange="filterMap('state_local_park', this)">State/Local Park
						  </label>
						</div>
				</form>
				</div> <!--  end of create report  -->

      <!-- Query Report Tab Panel -->
      <div class="tab-pane" id="addLandmarks">
            <form id = "add_landMarks_form">
            <br></br>
            <div><label>Landmark Type:</label>
            <select name="landmark_type">
            <option value="">Choose the Landmark Type:</option>
            <option value="Airport">Airport</option>
            <option value="Amusement">Amusement</option>
            <option value="Beach">Beach</option>
            <option value="Campground">Campground</option>
            <option value="GolfCourse">GolfCourse</option>
            <option value="Hotel">Hotel</option>
            <option value="Federal Land">Federal Land</option>
            <option value="National Park">National Park</option>
            <option value="Shopping Center">Shopping Center</option>
            <option value="State\Local Park">State\Local Park</option>                  
            </select>
              <button type="submit" class="btn btn-default" id="report_submit_btn">
                <span class="glyphicon glyphicon-star"></span> Submit
              </button>
              </div>
              </form>
        </div> <!--class="tab-pane" id="query_report"   -->
              
              </div> <!--  end of tab content -->
              
              </div> <!-- end of side bar  -->
<div id="map-canvas" class="col-md-9"></div>
</div> <!-- end of row -->
</div> <!-- container-fluid" -->
    
<!-- Scripts -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="js/loadmap.js"></script> 

</body>
</html>