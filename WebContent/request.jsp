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
		
		<title>Request</title>
		<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<script type="text/javascript">
			function createfield()
			{
				var count=document.getElementById("no_of_request").value;
				var a="<table><tr><td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center>S N0 </center></td><td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center> Items </center></td>"+
				"<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center>Quantity</center></td>"+
				"<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center>Donation Required Before</center></td>"+
				"<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center>Description(Optional)</center></td>"+
				"</tr>";
				for(i=0;i<parseInt(count);i++)
				{
					a+="<tr>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+(i+1)+"</td>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><input type=\"text\" name=\"request_"+i+"\" id=\"request_"+i+"\"></input></td>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><input type=\"text\" name=\"quantity_"+i+"\" id=\"quantity_"+i+"\"></input>"+
					"<select name=\"measurement_"+i+"\" id=\"measurement_"+i+"\">"+ 
					"<option>Select</option>"+
					"<option value=\"Rupee\">Rupee</option>"+
					"<option value=\"Person\">Person</option>"+
					"<option value=\"Kg\">Kg</option>"+
					"<option value=\"Piece\">Piece</option></select></td>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><input  type=\"date\" name=\"date_"+i+"\"></input></td>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"> <textarea name=\"description_"+i+"\"rows=5 cols=30></textarea></td>";
					a+="</tr>";
				}
				document.getElementById("request").innerHTML=a;
			}   
		</script>
		</head>
	<body id="body-pd">
		<form id="from1" action="AddRequest" method="post">
		Enter the number of Items : 
		<input type="text" id="no_of_request" name="no_of_request" />
		<button type="button" onclick="createfield()">Items</button><br><br>
		<div id="request"></div> <br><br>
		<input type="submit"/> 
		</form>
		<script type="text/javascript">
			document.querySelector('#from1').addEventListener('submit', function(e) {
			      var form = this;
			      var a="";
					var count=document.getElementById("no_of_request").value;
					console.log(count);
					for(i=0;i<parseInt(count);i++)
					{
						var b=document.getElementById("request_"+i).value;
						a+=b+" ";
						a+=document.getElementById("quantity_"+i).value+" "+document.getElementById("measurement_"+i).value+"\n";
					}
			      e.preventDefault();
			      
			      swal({
			          title: "Do you want to conform your list?",
			          text: a,
			          icon: "warning",
			          buttons: [
			            'No, cancel it!',
			            'Yes, I am sure!'
			          ],
			          dangerMode: true,
			        }).then(function(isConfirm) {
			          if (isConfirm) {
			            swal({
			              title: 'Done',
			              text: 'Your Request is successfully added',
			              icon: 'success'
			            }).then(function() {
			              form.submit();
			            });
			          } else {
			            swal("Cancelled", "Your request is cancelled", "error");
			          }
			        });
			    });
		</script>
		 <style>
		    .swal-button--confirm {
		      background-color: #DD6B55;
		    }
  		</style>
  		
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
	                            <span class="nav__name">Rise Request</span>
	                        </a>
	
	                        <a href="ngo-request.jsp" class="nav__link">
	                            <ion-icon name="eye-outline" class="nav__icon"></ion-icon>
	                            <span class="nav__name">View Donation</span>
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