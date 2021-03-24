<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Achievments</title>
		
		<script type="text/javascript">
			if(!!window.performance && window.performance.navigation.type === 2)
			{
			    window.location.reload();
			}
			function checkvalue(val)
			{
				if(val=="Others")
					document.getElementById('Other').style.display='block';
				else
					document.getElementById('Other').style.display='none';
			}
			
			function checkAward(val)
			{
				if(val=="Others")
					document.getElementById('OtherAward').style.display='block';
				else
					document.getElementById('OtherAward').style.display='none';
			}
			function popup()
			{
				confirm("Your Achievement is Saved Successfully");
			}
		</script>
		
	</head>
	<body>
	   <div style=" border-radius: 10px; overflow: hidden; width: 500px; margin-left: 30px; margin-top: 0px; background:  #4DC9FF">

                <div  style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px">

                    <b style="color: white"><font size="5px">Add Achievements</b><br></font>
                    <b style="color: white">-----------------------------------</b><br><br>

                    <form action="AddAchievement" method="post">

                        <b style="color: white"> <font size="4px">Type of Achievement : </font></b>      
                       
                        <select name="Type" onchange='checkvalue(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                                <option>Select</option>
                                <option value="Workshop">Workshop</option>
                                <option value="Paper Presentation">Paper Presentation</option>
                                <option value="Hackathon">Hackathon</option>
                                <option value="Internship">Internship</option>
                                <option value="Culturals">Culturals</option>
                                <option value="Sports">Sports</option>
                                <option value="Others">Others</option>
                        </select>

                        <input type="text" name="Other" id="Other" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 50px; width: 200px; margin-top: 10px; float: right; margin-right: 10px;display: none;margin-right: 25px" />

                       
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Hosted/Conducted by : </font></b>
                        <input name="Host" type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                        <br><br><br>  
                        <b style="color: white"> <font size="4px">Date : </font></b>
                        <input name="Date" type="date" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">    
                        <br><br><br>  

                        <b style="color: white"> <font size="4px">Awards : </font></b>    
                        <select name="Awards"  onchange='checkAward(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                            <option>Select</option>
                            <option value="1st Prize">1st Prize</option>
                            <option value="2nd Prize">2nd Prize</option>
                            <option value="3rd Prize">3rd Prize</option>
                            <option value="Participation">Participation</option>
                            <option value="Others">Others</option>
                        </select>
                        <br>
                        <input type="text" name="OtherAward" id="OtherAward" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px; margin-top: 10px; float: right; margin-right: 10px;display:none; margin-right: 145px"/><br><br>  
                        <br>        
                        <b style="color: white"> <font size="4px">Certificate Link</font></b>
                        <input name="certificate" type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;">    
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Description about Achievement(Optional)</font></b>
                        <br><br>
                        <textarea name="Description" rows="5" cols="30" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px"></textarea>
                        <br><br>
                        <input name="submit" type="submit" onclick="popup()" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff">
                    </form>
                </div>
            </div>
	</body>
</html>