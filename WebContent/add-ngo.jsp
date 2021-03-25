<%@page import="service.NgoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Ngo"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
		<title>NGO available</title>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script type="text/javascript">
			
		   function add(a,b)
			{
			   var ob=new XMLHttpRequest();
			   
			   ob.onreadystatechange=function ss()
		       {
		           if(ob.readyState==4)
		          	 {
		        	   Swal.fire({
						   title: 'Done', 
						   html: a+' is accepted successfully' ,  
						   icon: 'success',
						   confirmButtonText: "Ok", 
						 }); 
		          	 }
		       }
			   var path="AddNgo?email="+b;

		       ob.open("POST",path,true);
		       ob.send();
		       return true; 
			}
		
			function deletengo(a,b) {
				var ob=new XMLHttpRequest();
				   
				   ob.onreadystatechange=function ss()
			       {
			           if(ob.readyState==4)
			          	 {
			   				Swal.fire({
							   title: 'Done', 
							   html: b+' is rejected successfully' ,  
							   icon: 'success',
							   confirmButtonText: "Ok", 
							 }); 
			          	 }
			       }
				   var path="DeleteNgo?email="+a;

			       ob.open("POST",path,true);
			       ob.send();
			       return true;
			}
		</script>
	</head>
	<body id="body-pd">
			<%
	ArrayList<Ngo> allNgo = new NgoDao().getAllNgo();
    if(allNgo.size()==0)
    {
    	%>
    	   No NGOs available!
    	<%
    }
    else
    {
	for (Ngo ngo: allNgo) {
	
	%>

	<div style="margin: 30px 2%; width:45%; display: inline-block; border-radius: 10px; background: linear-gradient(to bottom, #ffff66 0%, #ff99cc 100%); text-align: center;">
		<div class="event" style="width: 100%; text-align: center; padding: 10px 0;">
	
			<h5 style="color: #blue;font-family: verdana;font-size: 20px;">NGO Email : <%=ngo.getUser_email() %></h5>
			<h5 style="color: #blue;font-family: verdana;font-size: 20px;"> Name : <%=ngo.getName() %> </h5>
			<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Address : <%=ngo.getAddress() %></h5>
			<h5 style="color: #blue;font-family: verdana;font-size: 20px;">Mobile Number : <%=ngo.getMobile_Number() %> </h5>
			<a href="<%=ngo.getDocument_Link() %>" style="color: #000;font-family: verdana;font-size: 20px;text-decoration: none;">click here to know more</a>
			<br>
			<button onclick='add("<%=ngo.getName() %>","<%=ngo.getUser_email() %>")' style="margin-top:15px; border-radius: 5px;border-width: 0px;background-color: #23a808;padding: 10px;">Accept</button>
			<button onclick='deletengo("<%=ngo.getUser_email() %>","<%=ngo.getName() %>")' style=" margin-top:15px; border-radius: 5px;border-width: 0px;background-color: #d40617;padding: 10px;">Reject</button>
			
		</div>
	</div>
	<% }}%>
	
	
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