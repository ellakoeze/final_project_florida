<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The Florida Project</title>
  <!-- Custom styles -->
<link rel="stylesheet" href="css/styles.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <!-- Google Map js libraries-->
   <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyD5Na0geM1T9MAdrJvnqDfU4jF-ooM_yvw&signed_in=true&libraries=places,visualization"></script>
</head>
<body>
 <div id="map-canvas"></div>
<script src="js/loadmap.js"></script> 
<script>
	window.onload = tests();
	function tests() {
		test_query_report();
	}

	function test_query_report() {
		$.ajax({
	  	 	url: 'HttpServlet',
	   	 	type: 'POST',
	    	data: { "tab_id": "1", "type": "golf_course"},
	    	success: function(data){ 
	    		alert('there are golf courses');
	    	},
	    	error: function(xhr, status, error) {
		    	alert("An AJAX error occured: " + status + "\nError: " + error);
		  	}
		});
	} 
</script>

</body>
</html>