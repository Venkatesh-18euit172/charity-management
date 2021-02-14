<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
	<body>
		<form action="">
			User email : <input type="text"></input><br><br>
			Password : <input type="password"></input><br><br>
			<input type="radio" id="admin" name="user" value="admin">
			<label for="admin">Admin</label>
			<input type="radio" id="ngo" name="user" value="ngo">
			<label for="ngo">NGO</label>
			<input type="radio" id="donor" name="user" value="donor">
			<label for="donor">Donor</label><br><br>
			<input type="submit" value="Login"></input> 
		</form>
	</body>
</html>