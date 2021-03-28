<%@page import="service.RequestDao"%>
<%@page import="model.Request"%>
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
		
		<title>Available request</title>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
		<script type="text/javascript">
			   function display(a)
			   {
				   Swal.fire({
					   title: "<i>Request Details</i>", 
					   html: a ,  
					   confirmButtonText: "Ok", 
					 });   
			   }
			   
			   function details(a)
			   {
				   var ob=new XMLHttpRequest();
				   
				   ob.onreadystatechange=function ss()
			       {
			           if(ob.readyState==4)
			          	 {
			        	  	var details=ob.responseText.split("||");
							var a="Mail ID : "+details[0]+"<br><br>";
							a+="Name    : "+details[1]+"<br><br>";
							a+="Address  : "+details[2]+"<br><br>";
							a+="Mobile Number   : "+details[3]+"<br><br>";
							a+="Document Link  : <a href="+details[4]+" target=_blank>"+details[4]+"</a>";
			        	  	Swal.fire({
								   title: "<i>NGO Details</i>", 
								   html: a ,  
								   confirmButtonText: "Ok", 
							});   
			          	 }
			       }
				   var path="GetNgoDetails?email="+a;

			       ob.open("POST",path,true);
			       ob.send();
			       return true;
			   }
			   
			   function donate(a,b,c)
			   {
   				   var ob=new XMLHttpRequest();
				   
				   ob.onreadystatechange=function ss()
			       {
			           if(ob.readyState==4)
			          	 {
						   Swal.fire({
							   title: "<i>Thank you for your Donation</i>", 
							   html: "<i class=\"em em-heart\" aria-role=\"presentation\" aria-label=\"BIRD\"></i>", //"\uD83D\uDE00" ,  
							   confirmButtonText: "Ok", 
							 });   
			          	 }
			       }
				   d=document.getElementById("donation_quantity_"+a).value;
				   e=document.getElementById("donation_date_"+a).value;
				   console.log(d+" "+e);
				   var path="Donate?details="+b+"?"+d+"?"+c+"?"+a+"?"+e;

			       ob.open("POST",path,true);
			       ob.send();
			       return true;
			   }
		 </script>
	</head>
	<body id="body-pd">
		<%
		   RequestDao obj=new RequestDao();
		   ArrayList<Request> req =obj.getRequest(); %>
		   	
		   	<table>
		          	<tr> 
		                <td style= "width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> S.No </center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> Items</center> </td>
		                <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> Required Quantity</center>  </td> 
		                <td style= "width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Donation Quantity</center> </td> 
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center>Expected Date</center> </td> 
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"><center> Donation Date</center> </td> 
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"> <center>Request Details</center> </td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"> <center>NGO Details</center></td>
		                <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;"> <center>Donate </center></td>
		            </tr>	
		             
		   <%for(int i=0;i<req.size();i++)
		   {
				String date[]=String.valueOf(req.get(i).getExpected_date()).split("-");
				String yyyy=date[0];String mm=date[1];String dd=date[2];
			   %>
			   	<tr> <td style= "width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> <%=i+1 %> </td> 
	            <td style= "width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).getType_of_request()%></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=req.get(i).getBalance_quantity()%><%out.print(" ");%><%=req.get(i).getMeasurements()%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><input type="text" id="donation_quantity_<%=req.get(i).getId()%>"><%=req.get(i).getMeasurements() %></td>
	            <td style= "width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><%=dd%>-<%=mm%>-<%=yyyy%></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"><input type="date" id="donation_date_<%=req.get(i).getId()%>"></td>
	            <td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> 
	            <button style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;" onclick='display("<%=req.get(i).getRequest_details()%>")' > Request Details </button></td>
				<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> 
				<button style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 7px;"  onclick='details("<%=req.get(i).getNgo_email()%>")' >NGO Detail</button> 
				</td>
				<td style= "width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;"> 
				<button onclick='donate("<%=req.get(i).getId()%>","<%=req.get(i).getNgo_email() %>","<%=req.get(i).getMeasurements()%>")' style="color: red; border-radius: 5px;border-width: 0px;background-color: #ffffff;padding: 10px;">Donate</button>
				</td>	            
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