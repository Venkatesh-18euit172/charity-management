<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
	<body>
	  <% 
	   
	   String value=request.getParameter("flag");
	   if(value!=null && value.equals("1"))
		    out.print("Invalid credentials");
	  %>
		<form action="Login" method="post">
			User email : <input type="text" name="mailid"></input><br><br>
			Password : <input type="password" name="password"></input><br><br>
			<input type="radio" id="ngo" name="user" value="ngo">
			<label for="ngo">NGO</label>
			<input type="radio" id="donor" name="user" value="donor">
			<label for="donor">Donor</label><br><br>
			<input type="submit" value="Login"></input> 
		</form>
	</body>
</html>