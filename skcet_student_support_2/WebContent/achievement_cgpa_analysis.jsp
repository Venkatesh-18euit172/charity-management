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
 
       // console.log(parseInt(details[0])+1,details[1]+1,details[2]+1)
       //  var details=[1,2,3,4,5,6,7];
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
   function piechart1()
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
 
       // console.log(parseInt(details[0])+1,details[1]+1,details[2]+1)
         var  details=[9,8.5,6,7.8,9,8,9,7];
          var data = google.visualization.arrayToDataTable([
					   	          ['Type of Achievement', 'Percentage'],
					   	          ['Semester 1',     parseFloat(details[0])],
					   	          ['Semester 2', parseFloat(details[1])],
					   	          ['Semester 3',  parseFloat(details[2])],
					   	          ['Semester 4', parseFloat(details[3])],
					   	          ['Semester 5',parseFloat(details[4])],
					   	          ['Semester 6',parseFloat(details[5])],
					   	          ['Semester 7',    parseFloat(details[6])],
					   	          ['Semester 8',    parseFloat(details[7])]
					   	        ]);
 
         var options = {
           title: 'My Performance'
         };
 
         var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
 
         chart.draw(data, options);
       }
             }
          }
         
          var path="CgpaGraph";

          ob.open("POST",path,false);
          ob.send(); 
          return true;
   }
   </script>
</head>
<body>
  <div id="piechart" style="float: left;margin-left: 20px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color: #FFF5EE  ;">
    <button onclick="piechart()" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;margin-top: 420px;color: #ffffff;margin-left: 200px;"><b>My achievement</b></button>
  </div>
  <div id="piechart1" style="float: right;margin-right: 20px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color:  #FFF5EE ;">
    <button onclick="piechart1()" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff;margin-top: 420px;color: #ffffff;margin-left: 200px;"><b>My performance</b></button>
  </div>
</body>
</html>