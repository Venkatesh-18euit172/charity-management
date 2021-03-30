<%@page import="service.DonorDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		 <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>Donation History</title>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
			function display(a)
			{
				   Swal.fire({
					   title: "<i>Request Details</i>", 
					   html: a ,  
					   confirmButtonText: "Ok", 
					 });   
			}
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
		           
		       			var a=[]
		       			
		       			a[0]=['Type of Contribution','Percentage'];
		       			for(i=0;i<details.length-1;i++)
		       			{
		       				console.log(details[i]);
		       				var temp=details[i].split("-");
		       				var d=[temp[0],parseInt(temp[1])];
		       				a[i+1]=d;
		       			}
		       			
		       			function drawChart() {
		 
					         var data = google.visualization.arrayToDataTable(a);
					 
					         var options = {
					           title: 'Donation history'
					         };
					 
					         var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					 
					         chart.draw(data, options);   
		           }
		         }
		        }
		        var path="DonationPiechart";

		        ob.open("POST",path,true);
		        ob.send(); 
		    }
		</script>
	</head>
	<body id="body-pd">
		
		<div id="piechart" style="float: left;margin-left: 410px;margin-top: 15px;width: 45%;height: 500px;border-radius: 5px;background-color: #FFF5EE  ;">
	    	<script type="text/javascript">piechart();</script>
	  	</div>
		
		<%
		 String mailid=(String)session.getAttribute("donormailid");
		ArrayList<ArrayList<String>> req =new DonorDao().showDonation(mailid); %>
		   	
		   	<table>
		          	<tr> 
		                <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center> S.No </center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center> Items</center> </td>
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center> Donation Quantity</center>  </td> 
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Donation Date</center> </td> 
		                <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Name</center> </td> 
		                <td style= "width : 230px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Address</center> </td> 
		                <td style= "width : 80px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"> <center>Mobile Number</center> </td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"> <center>Ngo Email</center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"> <center>Request Details</center></td>
		            </tr>	
		             
		   <%for(int i=0;i<req.size();i++)
		   {

			   %>
			   	<tr> <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"> <%=i+1 %> </td> 
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(0)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(1)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(2)%></td>
	            <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(3)%></td>
	            <td style= "width : 230px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(4)%></td>
	           	<td style= "width : 80px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(5)%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(6)%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"> 
	            <button style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;" onclick='display("<%=req.get(i).get(7)%>")' > Request Details </button></td>
				</tr>
			   <% 
		   }
			%>
		<div class="l-navbar" id="navbar">
	            <nav class="nav">
	                <div>
	                    <div class="nav__brand">
	                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
	                        <a href="#" class="nav__logo">Donor</a>
	                    </div>
	                    <div class="nav__list">
	                        
	                        <a href="#" class="nav__link active">
	                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Dashboard</span>
	                        </a>
	                        
	                        <a href="avaiable-request.jsp" class="nav__link">
	                            <ion-icon name="people-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">View Request</span>
	                        </a>
	
	                        <a href="donation-history.jsp" class="nav__link">
	                            <ion-icon name="podium-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">History</span>
	                        </a>
	                       
	                    </div>
	                </div>
	
	                <a href="Logout" class="nav__link">
	                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
	                    <span class="nav__name">Log Out</span>
	                </a>
	            </nav>
	        </div>
	
	     
	        <!-- ===== IONICONS ===== -->
	        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
	       
	        <!-- ===== MAIN JS ===== -->
	        <script src="js/main.js"></script>

	</body>
</html>