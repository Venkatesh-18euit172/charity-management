<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Registration</title>
        <script type="text/javascript">
            function validateForm(form) {
                var x = form.mailid.value;
                var atposition = x.indexOf("@");
                var dotposition = x.lastIndexOf(".");
                if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length) {
                    alert("Please enter a valid e-mail address");
                    return false;
                }
                var firstpassword = form.password.value;
                var secondpassword = form.password2.value;

                if (firstpassword == secondpassword) {
                    return true;
                } else {
                    alert("password must be same!");
                    return false;
                }
                console.log(1);
                return true;
            }
        </script>

    </head>
    <body>
        <div>
            <div style="float: left;margin-left: 100px; margin-top: 30px;">
                <img src="assests\donate.jpg" width="500px" height="300px" style="margin-top: 70px; margin-left: 50px;">
            </div>

            <div style=" border-radius: 10px; overflow: hidden; width: 500px; margin-left: 30px; margin-top: 100px; background:#0C4369; margin-left: 80px;" >

                <div  style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px;margin-left: 30px;">

                    <b style="color:white;"><font size="5px"> Register </b><br></font>
                    <b style="color:white;">-------------------</b><br>

                    <form action="TypeOfUser"  method="post" style="margin-top: 20px;" onsubmit="return validateForm(this)">
                        <b style="color:white;"> <font size="4px"> Enter your email id</font></b>
                        <input type="text" name="mailid" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 50px; width: 200px;"> </input><br><br>
                        <b style="color:white;"> <font size="4px"> Enter a new password </font></b>
                        <input type="password" name="password" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 32px; width: 200px;"> </input><br><br>
                        <b style="color:white;"> <font size="4px"> Re-enter password </font></b>
                        <input type="password" name="password2" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 55px; width: 200px;"> </input><br><br>
                        <input type="radio" id="ngo" name="user" value="ngo" style="margin-left:203px">
                        <label for="ngo"><b style="color:white;"> <font size="4px">NGO</font></b></label>
                        <input type="radio" id="donor" name="user" value="donor" >
                        <label for="donor"><b style="color:white;"> <font size="4px">Donor</font></b></label><br><br><br>
                        <input type="submit" value="Sign up" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 100px; width: 200px;background:#77A902;"></input>
                    </form>

                </div>
            </div>

        </div>
    </body>
</html>