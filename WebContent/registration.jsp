<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<script type="text/javascript">

</script>

</head>
<body>
<form action="TypeOfUser" method="post"> 
   Enter your email id
   <input type="text" name="mailid"> </input><br><br>
   Enter a new password
   <input type="password" name="password"> </input><br><br>
   Re-enter password
   <input type="password"> </input><br><br>
   <input type="radio" id="ngo" name="user" value="ngo">
   <label for="ngo">NGO</label>
   <input type="radio" id="donor" name="user" value="donor">
   <label for="donor">Donor</label><br><br>
   <input type="submit" value="Sign up"></input> 
</form>
</body>
</html>
