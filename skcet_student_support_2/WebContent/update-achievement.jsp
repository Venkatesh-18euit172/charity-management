<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList,dao.AchievementDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update Achievement</title>
		<script type="text/javascript">
			if(!!window.performance && window.performance.navigation.type === 2)
			{
			    window.location.reload();
			}
			function update(val)
			{
				var type=["Workshop","Paper Presentation","Hackathon","Internship","Culturals","Sports"];
				var award=["1st Prize","2nd Prize","3rd Prize","Participation"];
				var Row=document.getElementById(val);
				var Cells = Row.getElementsByTagName("td");

				document.getElementById("update_id").value =val;
				if(type.includes(Cells[1].innerHTML))
				{
					document.getElementById("type").value =Cells[1].innerHTML;
					document.getElementById('Other').style.display='none';
				}
				else
				{
					document.getElementById("type").value ="Others";
					document.getElementById('Other').style.display='block';
					document.getElementById("Other").value =Cells[1].innerHTML;
				}
				document.getElementById("host").value=Cells[2].innerHTML;
				document.getElementById("date").value=Cells[3].innerHTML;
				if(award.includes(Cells[4].innerHTML))
				{
   					document.getElementById("awards").value =Cells[4].innerHTML;
   					document.getElementById('OtherAward').style.display='none';
				}
				else
				{
					document.getElementById("awards").value ="Others";
					document.getElementById('OtherAward').style.display='block';
					document.getElementById("OtherAward").value =Cells[4].innerHTML;
				}
				document.getElementById("description").value=Cells[5].innerHTML;
				document.getElementById("certificate").value=Cells[6].innerHTML;
			}
			function popup()
			{
				confirm("Your Achievement is Updated Successfully");
			}
			
		</script> 
	</head>
	<body>
	   <%
			AchievementDao obj=new AchievementDao();   	      
			String registerNo=(String)session.getAttribute("registerNo");
			registerNo="18euit172";
		
			ArrayList<ArrayList<String>> a=obj.getData(registerNo);
			
			out.println("<table>"+
		             "<tr> "+
		                "<td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> S.No </center></td>"+
		                "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> Type </td>"+
		                "<td style= \"width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center>  Hosted/Conducted By  </td> "+
		                "<td style= \"width : 50px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center>Date </td> "+
		                "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center>Awards </td> "+
		                "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"><center> Description </td> "+
		                "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"> <center>Certification Link </td>"+
		                "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"> <center>Update</td>"+
		                " </tr> ")	;
			    
		    for(int i=0;i<a.size();i++)
		    {
		    	out.println(" <tr id="+ a.get(i).get(0) +" > <td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"> "+(i+1) +" </td> "+
		 	           " <td style= \"width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(1) +"</td>"+
		 	           " <td style= \"width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(2) +"</td>"+
		 	            "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(3)+"</td>"+
		 	            "<td style= \"width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(4)+"</td>"+
		 	            "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(5)+"</td>"+
		 	            "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+ a.get(i).get(6)+" </a></td>"+
		 	            "<td> <button style=\"border-radius: 5px ;height: 30px;border-width: 0px;  width: 130px;background: #38b6ff;padding: 10px;\" onclick='update("+a.get(i).get(0)+")' >Update</button> </td>"+
		 	             "</tr>");	    	
		    }
		      out.println("</table>");
	   %>
	 <div style=" border-radius: 10px; overflow: hidden; width: 500px; margin-left: 30px; margin-top: 0px; background:  #4DC9FF">

                <div  style="margin-left: 30px; margin-right: 30px;margin-top: 30px;margin-bottom: 30px">

                    <b style="color: white"><font size="5px">Update Achievements</b><br></font>
                    <b style="color: white">--------------------------</b><br><br>

                    <form action="UpdateAchievement" method="post">

                        <b style="color: white"> <font size="4px">Type of Achievement : </font></b>      
                       
                        <select name="Type" id="type" onchange='checkvalue(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                                <option>Select</option>
                                <option value="Workshop">Workshop</option>
                                <option value="Paper Presentation">Paper Presentation</option>
                                <option value="Hackathon">Hackathon</option>
                                <option value="Internship">Internship</option>
                                <option value="Culturals">Culturals</option>
                                <option value="Sports">Sports</option>
                                <option value="Others">Others</option>
                        </select>
						</select><input type="text" name="update_id" id="update_id" style='display:none'/>
                        <input type="text" name="Other" id="Other" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 50px; width: 200px; margin-top: 10px; float: right; margin-right: 10px;display: none;margin-right: 25px" />

                       
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Hosted/Conducted by : </font></b>
                        <input name="Host" id="host" type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
                        <br><br><br>  
                        <b style="color: white"> <font size="4px">Date : </font></b>
                        <input name="Date" id="date" type="date" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">    
                        <br><br><br>  

                        <b style="color: white"> <font size="4px">Awards : </font></b>    
                        <select name="Awards" id="awards" onchange='checkAward(this.value)' style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px">
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
                        <input name="certificate" id="certificate" type="text" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;">    
                        <br><br><br>
                        <b style="color: white"> <font size="4px">Description about Achievement(Optional)</font></b>
                        <br><br>
                        <textarea name="Description" id="description" rows="5" cols="30" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px"></textarea>
                        <br><br>
                        <input name="submit" type="submit" onclick="popup()" style="border-radius: 5px ;height: 30px;border-width: 0px; margin-left: 10px; width: 200px;background: #38b6ff">
                    </form>
                </div>
            </div>
	</body>
</html>