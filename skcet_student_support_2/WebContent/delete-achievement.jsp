<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList,dao.AchievementDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Delete Achievement</title>
		<script type="text/javascript">
			if(!!window.performance && window.performance.navigation.type === 2)
			{
			    window.location.reload();
			}
			function popup()
			{
				confirm("Your Achievement is Deleted Successfully");
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
			                "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFFF99;padding: 10px;\"> <center>Delete</td>"+
			                		" </tr> ")	;
			     
			    for(int i=0;i<a.size();i++)
			    {
			    	out.println(" <tr> <td style= \"width : 70px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\"> "+(i+1) +" </td> "+
				 	           " <td style= \"width : 200px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(1) +"</td>"+
				 	           " <td style= \"width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(2) +"</td>"+
				 	            "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(3)+"</td>"+
				 	            "<td style= \"width : 150px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(4)+"</td>"+
				 	            "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(5)+"</td>"+
				 	            "<td style= \"width : 100px;border: 1px ;border-collapse: collapse;border-color: #FFFF99;background-color: #FFC0CB;padding: 10px;\">"+a.get(i).get(6)+"</td>"+
				 	            "<td><form action=\"DeleteAchievement?delete_id="+a.get(i).get(0)+"\" method=\"post\"> <input style=\"border-radius: 5px ;height: 30px;border-width: 0px;  width: 130px;background: #38b6ff;padding: 10px;\"" 
				 	            + "name=\"submit\" type=\"submit\" onclick=\"popup()\" value=\"Delete\""+ " onclick='delete_id("+a.get(i).get(0) +")'> </form></td></tr>");
			    }
			      out.println("</table>");
		   %>
	</body>
</html>