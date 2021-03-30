<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="service.NgoDao"%>
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
				
		<title> Confirm Donations</title>
		<script type="text/javascript">
			   function received(a)
			   {
				   var obj=new XMLHttpRequest();
				   obj.onreadystatechange=function ss()
				   {
					   if(obj.readyState==4)
						   {
						    
							    location.reload();
							   
						   }
				   }
				   var path="ReceivedDonation";
				   obj.open("POST",path,true);
				   obj.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				   obj.send("id="+a);
				   
			   }   
		</script>
	</head>
	<body id="body-pd">
		<%
		 String mailid=(String)session.getAttribute("ngomailid");
		ArrayList<ArrayList<String>> req =new NgoDao().receivedDonation(mailid); %>
		   	
		   	<table>
		          	<tr> 
		                <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center> S.No </center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Items</center> </td>
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Requested Quantity</center>  </td> 
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Donated Quantity</center> </td> 
		                <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Donation Date</center> </td> 
		                <td style= "width : 230px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"><center>Donor email</center> </td> 
		                <td style= "width : 80px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"> <center>Donor Name</center> </td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"> <center>Mobile Number</center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #3377ff;padding: 10px;"> <center>Status</center></td>
		            </tr>	
		             
		   <%for(int i=0;i<req.size();i++)
		   {

			   %>
			   	<tr> <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color:#b3ccff;padding: 10px;"> <%=i+1 %> </td> 
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(0)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(1)%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(2)%></td>
	            <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(3)%></td>
	            <td style= "width : 230px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(4)%></td>
	           	<td style= "width : 80px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(5)%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"><%=req.get(i).get(6)%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #b3ccff;padding: 10px;"> 
	            <button style="color:#00cc00; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;" onclick='received("<%=req.get(i).get(7)%>,<%=req.get(i).get(2)%>")' > Received donation </button></td>
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