<%@page import="model.Donor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.DonorDao"%>
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
       
<title>View Donor</title>
</head>
<body id="body-pd">
<%
ArrayList<Donor> allDonor = new DonorDao().getAllDonor();

for (Donor donor: allDonor) {

%>

<div style="margin: 30px 2%; width:40%; display: inline-block;border-radius: 10px; background: #00c0fc;">
<div class="event" style="padding: 0px;margin-top: 30px;margin-left: 30px;margin-right: 30px;height:50%;">

<h5 style="color: #000000;font-family: verdana;font-size: 14px;"><b>NGO Email : </b><font style="color: #ffffff;font-family: verdana;font-size: 14px;"><%=donor.getUser_email() %></h5></font>
<h5 style="color: #000000;font-family: verdana;font-size: 14px;"><b> Name : </b><font style="color: #ffffff;font-family: verdana;font-size: 14px;"><%=donor.getName() %> </h5></font>
<h5 style="color: #000000;font-family: verdana;font-size: 14px;"><b>Address : </b><font style="color: #ffffff;font-family: verdana;font-size: 14px;"><%=donor.getAddress() %></h5></font>
<h5 style="color: #000000;font-family: verdana;font-size: 14px;"><b>Mobile Number : </b><font style="color: #ffffff;font-family: verdana;font-size: 14px;"><%=donor.getMobile_Number() %> </h5></font>

</div>
</div>
<% }%>

<div class="l-navbar" id="navbar">
           <nav class="nav">
               <div>
                   <div class="nav__brand">
                       <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                       <a href="#" class="nav__logo">Admin</a>
                   </div>
                   <div class="nav__list">
                       
                       <a href="#" class="nav__link active">
                           <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                           <span class="nav__name">Dashboard</span>
                       </a>
                       
                       <a href="add-ngo.jsp" class="nav__link">
                           <ion-icon name="person-add-outline" class="nav__icon"></ion-icon>
                           <span class="nav__name">Add NGO</span>
                       </a>

                       <a href="view-ngo.jsp" class="nav__link">
                           <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                           <span class="nav__name">View NGO</span>
                       </a>
                     

                       <a href="view-donor.jsp" class="nav__link">
                           <ion-icon name="people" class="nav__icon"></ion-icon>
                           <span class="nav__name">View Donor</span>
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