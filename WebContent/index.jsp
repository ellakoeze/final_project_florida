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


 <!-- Google Map js libraries-->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=YOURAPIKEY&signed_in=true&libraries=places,visualization"></script>

</head>
<body>
<!-- Header (Navigation Bar) -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Florida Vacation Planner</a>
      <!-- I think this needs to be added for the legend to get he correct landmark -->
      <!--  <select onchange="onSelectReportType(this)" name="type">  -->
      
      </div>
</nav>

<!-- Map panel -->
  <div class="container-fluid">
    <div class="row">
      <div class="sidebar col-xs-3">
        <!-- Tab Navis-->
        <ul class="nav nav-tabs">
          <li class="active"><a href="#query_landmarks" data-toggle="tab">Legend</a></li>
          <li><a href="#query_landmarks" data-toggle="tab">Add Landmark</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content ">
          <!-- Create Legend Tab Panel -->
          <div class="tab-pane active" id="create_report">
            <form id = "create_report_form">
            <br></br>
            <div class="btn-group-toggle" data-toggle="buttons">
  <label class="btn primary">
    <input type="checkbox" autocomplete="off"> Show All
  </label>
  </select>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Airport
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Amusement
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Beach
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Campground
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Golf Course
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Hotel
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> National Forest
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Federal Land
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
    <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off"> Shopping Center
  </label>
</div>
<div class="btn-group-toggle" data-toggle="buttons">
  <img src="/img/beach-icon.png">
  <label class="btn btn-secondary active">
    <input type="checkbox" checked autocomplete="off">State/Local Park
  </label>
  </div>
  </form>
</div>

      <!-- Query Report Tab Panel -->
      <div class="tab-pane" id="query_report">
            <form id = "query_report_form">
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
              </div>
              </div>
              </div>
<div id="map-canvas" class="col-md-9"></div>
</div>
</div>
    
<!-- Scripts -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="js/loadmap.js"></script> 

</body>
</html>


