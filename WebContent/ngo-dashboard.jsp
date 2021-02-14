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
		
		<title>Ngo Dahboard</title>
	</head>
	<body id="body-pd">
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