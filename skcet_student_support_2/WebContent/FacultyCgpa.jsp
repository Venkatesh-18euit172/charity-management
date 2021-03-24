<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Analysis</title>
		  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	    var request;
	    function piechart()
	    {
	    	
	    	var url="FacultyCgpa?from="+document.getElementById("from").value+"?"+document.getElementById("to").value;  
	    	
	    	if(window.XMLHttpRequest){  
	    		request=new XMLHttpRequest();  
	    	}  
	    	else if(window.ActiveXObject){  
	    		request=new ActiveXObject("Microsoft.XMLHTTP");  
	    	}  
	    	  
	    	try{  
		    	request.onreadystatechange = function getInfo() {
		    		
			    	if(request.readyState==4){  
			    		  
			    		var details=request.responseText.split("||");
				        google.charts.load('current', {'packages':['corechart']});
				   	    google.charts.setOnLoadCallback(drawChart);
				   	
				   	    function drawChart() {
				   	      		
				   	        	var data = google.visualization.arrayToDataTable([
					   	          ['Type of Achievement', 'Percentage'],
					   	          ['Semester 1',     parseFloat(details[0])],
					   	          ['Semester 2', parseFloat(details[1])],
					   	          ['Semester 3',  parseFloat(details[2])],
					   	          ['Semester 4', parseFloat(details[3])],
					   	          ['Semester 5',parseFloat(details[4])],
					   	          ['Semester 6',parseFloat(details[5])],
					   	          ['Semester 7',    parseFloat(details[6])],
					   	          ['Semester 8',    parseFloat(details[6])]
					   	        ]);
				   	
					   	        var options = {
					   	          title: 'CGPA Analysis'
					   	        };
					   	
					   	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					   	
					   	        chart.draw(data, options);
					   	      } 
				  
				  }
		    	};  
		    	request.open("POST",url,true);  
		    	request.send();  
	    	}
	    	catch(e)
	    	{
	    		alert("Unable to connect to server");
	    	}  
	    }   
	    </script>
	</head>
	<body>
		Choose the RollNo from : <input type="text" name="from" id="from">
		Choose the RollNo to : <input type="text" name="to" id="to">
		<button onclick="piechart()">CGPA Analysis</button>
		<div id="piechart" style="width: 900px; height: 500px;"></div>
		<br><br>
	</body>
</html>