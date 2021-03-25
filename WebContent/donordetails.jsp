<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Donor</title>
<script type="text/javascript">
function storedonor()
{
	var emailid=document.getElementById("emailid").value;
	var name=document.getElementById("name").value;
	var address=document.getElementById("address").value;
	var mobile=document.getElementById("mobno").value;
	
    
	var flag=0;
	if(emailid==null)
	{
	document.getElementById("missingid").innerHTML="This field is mandatory!";
	flag=1;
	}
	if(name==null)
	{
	document.getElementById("missingname").innerHTML="This field is mandatory!";
	flag=1;
	}
	if(address==null)
	{
	document.getElementById("missingadd").innerHTML="This field is mandatory!";
	flag=1;
	}
	if(mobile==null)
	{
	document.getElementById("missingmob").innerHTML="This field is mandatory!";
	flag=1;
	}
	

   if(flag==0)
	{
	   var ob=new XMLHttpRequest();
		ob.onreadystatechange=function ss()
       {
			if(ob.readyState==4)
			{
				confirm("Saved successfully!");
			}
       }
		var path="StoreDonorDetails?donordetailsentered="+emailid+"?"+name+"?"+address+"?"+mobile;

       ob.open("POST",path,true);
       ob.send();
	}
}
</script>

</head>
<body>
    
    Email id
    <input type="text" id="emailid"></input><label id="missingid"></label><br><br>
    Name
    <input type="text" id="name"></input><label id="missingname"></label><br><br>
    Address
    <input type="text" id="address"></input><label id="missingadd"></label><br><br>
    Mobile Number
    <input type="text" id="mobno"></input><label id="missingmob"></label><br><br>
    
    <button onclick="storedonor()"> Submit</button><br><br>
</body>
</html>