<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Analysis</title>
		  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	    function piechart()
	    {
          var ob=new XMLHttpRequest();

          ob.onreadystatechange=function ss()
          {
           if(ob.readyState==4)
           {
        	     var details=ob.responseText.split("||");
	             google.charts.load('current', {'packages':['corechart']});
	   	    	  google.charts.setOnLoadCallback(drawChart);
	   	
	   	      	function drawChart() {
	   	
	   	      		console.log(parseInt(details[0])+1,details[1]+1,details[2]+1)
	   	      		
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
		   	          title: 'My Achievement'
		   	        };
		   	
		   	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		   	
		   	        chart.draw(data, options);
		   	      }
           	}
          }
          
          var path="Analysis";

          ob.open("POST",path,false);
          ob.send();
          return true;
	    }
	    </script>
	    
	    <script type="text/javascript">
			function getGraph() {
				
				var ob=new XMLHttpRequest();
		        
				ob.onreadystatechange=function draw() {
			        /* Accepting and seperating comma seperated values */
			        var values =ob.responseText.split(",");
			        
			        var canvas = document.getElementById('myCanvas');
			        var ctx = canvas.getContext('2d');
	
			        var width = 40; //bar width
			        var X = 50; // first bar position 
			        var base = 200;
			        
			        for (var i =0; i<values.length; i++) {
			            ctx.fillStyle = '#008080'; 
			            var h = values[i];
			            ctx.fillRect(X,canvas.height - h,width,h);
			            
			            X +=  width+15;
			            /* text to display Bar number */
			            ctx.fillStyle = '#4da6ff';
			            ctx.fillText(values[i],X-50,canvas.height - h -10);
			        }
			            /* Text to display scale */
			            ctx.fillStyle = '#000000';
			            ctx.fillText('Scale X : '+canvas.width+' Y : '+canvas.height,800,10);
			  
			    }
				var path="CgpaGraph";
				
				ob.open("POST",path,false);
		        ob.send();
		
		        return true;
			}
	    </script>
	</head>
	<body>
		<button onclick="piechart()"> My achievement</button>
		<div id="piechart" style="width: 900px; height: 500px;"></div>
		<br><br>
		<button onclick="piechart()"> My performance</button>
		<canvas id="myCanvas" width="900" height="300" style="border:1px solid #c3c3c3;">
	    </canvas>
	</body>
</html>