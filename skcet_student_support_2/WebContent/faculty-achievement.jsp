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
	    	
	    	var url="FacultyAchievement?from="+document.getElementById("from").value+"?"+document.getElementById("to").value;  
	    	  
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
						   	          ['WorkShop',     parseInt(details[0])],
						   	          ['Paper Presentation', parseInt(details[1])],
						   	          ['Internship',  parseInt(details[2])],
						   	          ['Hackathon', parseInt(details[3])],
						   	          ['Culturals',parseInt(details[4])],
						   	          ['Sports',parseInt(details[5])],
						   	          ['Others',    parseInt(details[6])]
					   	        ]);
				   	
					   	        var options = {
					   	          title: 'Achievement Analysis'
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

		<font style="margin-left: 10px;margin-top: 10px;font-color: #696969"><b>Choose the RollNo from : </b></font><input type="text" name="from" id="from" style="border-radius: 5px ;height: 20px;border-width: 0px; margin-left: 10px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;"><br><br>
		<font style="margin-left: 10px;margin-top: 10px;font-color: #696969"><b>Choose the RollNo to : </b></font><input type="text" name="to" id="to" style="border-radius: 5px ;height: 20px;border-width: 0px; margin-left: 30px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;"><br><br>
		<button onclick="piechart()" style="border-radius: 5px ;height: 35px;border-width: 0px; margin-left: 140px; width: 170px;background: #38b6ff;margin-top: 10px;color: #ffffff;"><b>Achievement Analysis</b></button><br>
		<div id="piechart" style="margin-left: 10px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color: #FFF5EE  ;"></div>
		<br><br>
	</body>
</html>