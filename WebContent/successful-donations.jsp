<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="service.RequestDao"%>
<%@page import="model.Request"%>
<%@page import="java.util.ArrayList"%>
  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
				
		<title>Successful Donations</title>
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
		 String mailid=(String)session.getAttribute("ngomailid");
		 ArrayList<Request> req =new RequestDao().successfulDonations(mailid);	
		for (Request Req: req) {
		String date[]=String.valueOf(Req.getExpected_date()).split("-");
		String yyyy=date[0];String mm=date[1];String dd=date[2];
		%>
	
		<div style="margin: 30px 2%; width:45%; display: inline-block; border-radius: 10px;  background: linear-gradient(to bottom, #ffff66 0%, #66ff99 100%); text-align: center;">
			<div class="event" style="width: 100%; text-align: center; padding: 10px 0;">
		
				<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Type of Request : <%=Req.getType_of_request()%></h5>
				<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Quantity Required : <%=Req.getTotal_quantity()%><%out.print(" ");%><%=Req.getMeasurements()%> </h5>
				<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Expected Date :<%=dd%>-<%=mm%>-<%=yyyy%></h5>
				<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> 
	            <button style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;" onclick='display("<%=Req.getRequest_details()%>")' > Request Details </button></td>
				<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> 
				<button style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;"><a href='SuccessfulDonorList?id=<%=Req.getId()%>'>View Donation</a></button> </td>
				
			</div>
		</div>
		<% }%>
		
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
	                        
	                        <a href="ngo-history.jsp" class="nav__link">
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