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

            String value = request.getParameter("flag");
            if (value != null && value.equals("1")) {
                out.print("<font style=color:#ff0000;font-size:20px>Invalid credentials</font>");
            }
        %>

        <div style="float: left;">
            <img src="assests\donate_1.jpg" width="600px" height="600px" style="margin-top: 30px; margin-left: 50px;">
        </div>


        <div style="background-image: url('assests\\login.png'); width: 500px;height: 500px; float: right; margin-right: 160px; margin-top: 15px; ">           
            <form action="Login" method="post">
                <input type="text" name="mailid" required style="margin-top: 220px;margin-left: 220px;background-color: #FFFFFF;border-radius: 5px;border-width: 0px;width: 200px; height: 40px;"></input><br><br>
                <input type="password" name="password" required style="margin-top: 80px;margin-left: 130px;background-color: #FFFFFF;border-radius: 5px;border-width: 0px;width: 280px; height: 40px;"></input><br><br>
                <input type="radio" id="ngo" name="user" value="ngo" style="margin-left: 200px;">
                <label for="ngo">NGO</label>
                <input type="radio" id="donor" name="user" value="donor" style="margin-left: 50px;">
                <label for="donor">Donor</label><br><br>
                <input type="submit" value="Login" style="border-radius: 10px;width: 150px;height: 50px; background-color: #38B6ff; margin-top: 60px;border-width: 0px; margin-left: 200px; font-family: verdana; font-style: bold;"></input>
            </form>

        </div>

    </body>
</html>
