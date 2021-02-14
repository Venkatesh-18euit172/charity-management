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
		
		<title>Admin Dashboard</title>
	</head>
	<body id="body-pd">
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