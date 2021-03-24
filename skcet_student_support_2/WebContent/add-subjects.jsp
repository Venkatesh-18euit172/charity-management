<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add Subjects</title>
		<script type="text/javascript">
			function addSubject(val)
			{
				var a="<table><tr><td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center>Subject Name </center></td><td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center> Subject Code </center></td><td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 1px;\"><center>Credits</center></td></tr>";
				for(i=0;i<parseInt(val);i++)
				{
					a+="<tr>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><input type=\"text\" name=\"subject_"+i+"\"></input></td>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><input type=\"text\" name=\"subject_code_"+i+"\"></input></td>";
					a+="<td style= \"height:30px;width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"><input type=\"text\" name=\"credits_"+i+"\"></input></td>";
					a+="</tr>";
				}
				a+="</table>";
				document.getElementById("subject_details").innerHTML=a;
			}
		</script>
	</head>
	<body>
	<form action="AddSubject" method="post">
		<font style="margin-left: 10px;margin-top: 10px;font-color: #696969"><b>Select the Semester : </b></font>
		<select name="semester" style="border-radius: 5px ;height: 40px;border-width: 0px; margin-left: 10px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;">
				<option>Select</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
		</select>
		<br><br>
		<font style="margin-left: 10px;margin-top: 10px;font-color: #696969"><b>Select the number of Subjects : </b></font>
		<select name="subject" onchange="addSubject(this.value)" style="border-radius: 5px ;height: 40px;border-width: 0px; margin-left: 10px; width: 200px;background-color: #F0FFF0;padding: 10px;margin-top: 20px;">
				<option>Select</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
		</select>
		<br><br>
		<div id="subject_details"></div>
		<input type="submit" value="Submit" style="border-radius: 5px ;height: 35px;border-width: 0px; margin-left: 140px; width: 170px;background: #38b6ff;margin-top: 10px;color: #ffffff;"></input>
	</form>
	</body>
</html>