<%@page import="service.NgoDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body id="body-pd">

    <%
	   String mailid=(String)session.getAttribute("ngomailid");
		ArrayList<ArrayList<String>> req =new NgoDao().ngoHistory(mailid); %>
		   	
		   	<table>
		          	<tr> 
		                <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> S.No </center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Items</center> </td>
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Requested quantity</center>  </td> 
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Donated quantity</center> </td> 
		                <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Donor Name</center> </td> 
		                <td style= "width : 230px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Donor email</center> </td> 
		                <td style= "width : 80px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"> <center>Donor Mobile Number</center> </td>
		                
		            </tr>	
		             
		   <%for(int i=0;i<req.size();i++)
		   {

			   %>
			   	<tr> <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> <%=i+1 %> </td> 
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).get(0)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).get(1)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).get(2)%></td>
	            <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).get(3)%></td>
	            <td style= "width : 230px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).get(4)%></td>
	           	<td style= "width : 80px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).get(5)%></td>
	            
				</tr>
			   <% 
		   }
			%>
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