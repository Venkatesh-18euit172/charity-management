<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>NGO</title>
        <script type="text/javascript">
            function storengo()
            {
                var emailid = document.getElementById("emailid").value;
                var name = document.getElementById("name").value;
                var address = document.getElementById("address").value;
                var mobile = document.getElementById("mobno").value;
                var doclink = document.getElementById("doclink").value;
               
               
               
                var atposition = emailid.indexOf("@");
                var dotposition = emailid.lastIndexOf(".");
                if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= emailid.length) {
                    alert("Please enter a valid e-mail address");
                   
                    flag=1;
                    //return;
                }

                //var name = document.name.value;
               
               

                var flag = 0;
                if (emailid == "" ||emailid==null)
                {
                    //document.getElementById("missingid").innerHTML = "This field is mandatory!";
                    alert("Please enter a e-mail address");
                   
                    flag = 1;
                   
                }
                if (name == ""||name==null)
                {
                    //document.getElementById("missingname").innerHTML = "This field is mandatory!";
                    alert("Please enter name");
                   
                    flag = 1;
                   
                }
                if (address == ""||address==null)
                {
                    //document.getElementById("missingadd").innerHTML = "This field is mandatory!";
                    alert("Please enter address");
                   
                    flag = 1;
                   
                }
                if (mobile == ""||mobile==null)
                {
                    //document.getElementById("missingmob").innerHTML = "This field is mandatory!";
                    alert("Please enter a mobile no");
                   
                    flag = 1;
                   
                }
                if (doclink == ""||doclink==null)
                {
                    //document.getElementById("missingdoc").innerHTML = "This field is mandatory!";
                    alert("Please enter a document link");
                   
                    flag = 1;
                   
                    //flag = 1;
                }

                if (flag == 0)
                {
                    var ob = new XMLHttpRequest();
                    ob.onreadystatechange = function ss()
                    {
                        if (ob.readyState == 4)
                        {
                            confirm("Saved successfully!");
                            window.location.href="login.jsp";
                        }
                    }
                    var path = "StoreNgoDetails?ngodetailsentered=" + emailid + "?" + name + "?" + address + "?" + mobile + "?" + doclink;
                    console.log(emailid+" "+name+" "+address+" "+mobile);
                    ob.open("POST", path, true);
                    ob.send();
                }
            }

         
        </script>

    </head>
    <body>
        <div>
            <div style="float: left;margin-left: 100px; margin-top: 30px;">
                <img src="assests\donate.jpg" width="500px" height="300px" style="margin-top: 70px; margin-left: 50px;">
            </div>

            <div style=" border-radius: 10px; overflow: hidden; width: 550px;margin-top: 100px; background: #0C4369; margin-left: 80px;" >

                <div  style="margin-left: 70px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px;">


                    <b style="color: white;"><font size="5px"> Give Details </b><br></font>
                    <b style="color: white;">------------------------</b><br>

                    <b style="color: white;"> <font size="4px">Email id</font></b>
                    <input type="text" id="emailid" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 120px; width: 200px;" ></input><label id="missingid"></label><br><br>
                    <b style="color: white;"> <font size="4px"> Name</font></b>
                    <input type="text" id="name" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 140px; width: 200px;"></input><label id="missingname"></label><br><br>
                    <b style="color: white;"> <font size="4px"> Address</font></b>
                    <input type="text" id="address" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 123px; width: 200px;"></input><label id="missingadd"></label><br><br>
                    <b style="color: white;"> <font size="4px"> Mobile Number</font></b>
                    <input type="text" id="mobno" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 65px; width: 200px;"></input><label id="missingmob" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"></label><br><br>
                    <b style="color: white;"> <font size="4px"> Attach Document Link</font></b>
                    <input type="text" id="doclink" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;"></input><label id="missingdoc" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;" ></label><br><br>
                    <button onclick="storengo()" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 70px; width: 200px;background: #38b6ff;">Submit</button>


                </div>
            </div>

        </div>

    </body>
</html>
