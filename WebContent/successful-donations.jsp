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

<div style="margin: 30px 2%; display: inline-block; border-radius: 10px; background: #00c0fc">
<div class="event" style="padding: 0px;margin-top: 30px;margin-left: 30px;margin-right: 30px;">

<h5 style="color: #000000;font-family: verdana;font-size: 14px;"><b>Type of Request : </b><font style="color: #ffffff;font-family: verdana;font-size: 14px;"><%=Req.getType_of_request()%></font></h5>
<h5 style="color: #000000;font-family: verdana;font-size: 14px;"><b>Quantity Required : </b><font style="color: #ffffff;font-family: verdana;font-size: 14px;"><%=Req.getTotal_quantity()%><%out.print(" ");%><%=Req.getMeasurements()%></font></h5>
<h5 style="color: #000000;font-family: verdana;font-size: 14px;"><b>Expected Date : </b><font style="color: #ffffff;font-family: verdana;font-size: 14px;"><%=dd%>-<%=mm%>-<%=yyyy%></font></h5>
<hr>
<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;">
           <button style="margin-top:15px; border-radius: 5px;border-width: 0px;background-color: #FFCCCB;padding: 10px;margin-bottom: 5px;" onclick='display("<%=Req.getRequest_details()%>")' > Request Details </button></td>
<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;">
<button style=" margin-top:15px; border-radius: 5px;border-width: 0px;background-color: #FFCCCB;padding: 10px;margin-bottom: 5px;"><a href='SuccessfulDonorList?id=<%=Req.getId()%>'>View Donation</a></button> </td>

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
