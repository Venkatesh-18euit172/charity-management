<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.DonorDao"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>Donation List</title>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script type="text/javascript">
			function display(a)
		   {
			   Swal.fire({
				   title: "<i>Request Details</i>", 
				   html: a ,  
				   confirmButtonText: "Ok", 
				 });   
		   }
		</script>
	</head>
	<body id="body-pd">
		
		<%
			ArrayList<String> requestDetails=(ArrayList<String>)request.getAttribute("Request Details");
			
		%>
		<div style="left:50;margin-left: 410px; width:45%; display: inline-block; border-radius: 10px; background:linear-gradient(to bottom, #66ff99 0%, #00ccff 100%); text-align: center;">
			<div class="event" style="width: 100%; text-align: center; padding: 10px 0;">
		
				<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Type of Request : <%=requestDetails.get(0) %></h5>
				<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Total Quantity : <%=requestDetails.get(1) %> </h5>
				<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Balance Quantity : <%=requestDetails.get(2) %></h5>
				<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Expected Date : <%=requestDetails.get(3) %> </h5>
			    <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> 
	            <button style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;" onclick='display("<%=requestDetails.get(4)%>")' > Request Details </button></td>
			</div>
		</div>
		<br><br>
		
		<table style = "margin-left: auto; margin-right: auto;">
		     <tr> 
		        <td style= "width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center> S.No </center></td>
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center> Donation Quantity</center> </td>
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>  Donation Date</center>  </td> 
		        <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Name</center> </td> 
		        <td style= "width : 300px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Address</center> </td> 
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center> Mobile Number</center> </td> 
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"> <center>Email ID</center> </td>
		            </tr>	
		<%
		ArrayList<ArrayList<String>> allDonation = (ArrayList<ArrayList<String>>) request.getAttribute("Donation-List");
		int i=0;
		for (ArrayList<String> donor: allDonation) {
		i++;
		%>
		     <tr> 
		        <td style= "width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><center> <%= i %> </center></td>
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><center> <%=donor.get(1) %></center> </td>
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><center>  <%=donor.get(2) %></center>  </td> 
		        <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><center><%=donor.get(3) %></center> </td> 
		        <td style= "width : 300px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><center><%=donor.get(4) %></center> </td> 
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><center> <%=donor.get(5) %></center> </td> 
		        <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"> <center><%=donor.get(0) %></center> </td>
		         </tr>	
			
		<% }%>
		</table>
		
		<div class="l-navbar" id="navbar">
	            <nav class="nav">
	                <div>
	                    <div class="nav__brand">
	                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
	                        <a href="#" class="nav__logo">Ngo</a>
	                    </div>
	                    <div class="nav__list">
	                        
	                        <a href="#" class="nav__link active">
	                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Dashboard</span>
	                        </a>
	                        
	                         <a href="request.jsp" class="nav__link">
	                            <ion-icon name="add-circle-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Raise Request</span>
	                        </a>
	
	                        <a href="ngo-request.jsp" class="nav__link">
	                            <ion-icon name="eye-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Pending Requests</span>
	                        </a>
	                        
	                        <a href="received-donation.jsp" class="nav__link">
	                            <ion-icon name="checkbox-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Confirm Donations</span>
	                        </a>
	                        
	                         <a href="successful-donations.jsp" class="nav__link">
	                            <ion-icon name="ribbon-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Successful donations</span>
	                        </a>
	                       
	
	                        <a href="request-history.jsp" class="nav__link">
	                            <ion-icon name="book-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">Donation History</span>
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