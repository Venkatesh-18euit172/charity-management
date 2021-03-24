<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Student Upload</title>
	</head>
	<body>
		<form action="StudentUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="student-file"></input>
			<br><br>
			<input type="submit"></input>
		</form>
	</body>
</html>