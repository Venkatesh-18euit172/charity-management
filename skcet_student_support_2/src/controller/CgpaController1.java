package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CgpaDao;


@WebServlet("/Cgpa")

public class CgpaController1 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		  CgpaDao obj=new CgpaDao();
	      response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      ArrayList<String> no_subject=new ArrayList<String>();
	      no_subject.add("one");no_subject.add("two");no_subject.add("three");no_subject.add("four");
	      no_subject.add("five");no_subject.add("six");no_subject.add("seven");no_subject.add("eight");
	      
	      
	      ArrayList<String> subjectcredit=new ArrayList<String>();
	      subjectcredit.add("onecredit");subjectcredit.add("twocredit");subjectcredit.add("threecredit");subjectcredit.add("fourcredit");
	      subjectcredit.add("fivecredit");subjectcredit.add("sixcredit");subjectcredit.add("sevencredit");subjectcredit.add("eightcredit");
	      
	      ArrayList<ArrayList<String>> a=obj.getCredits(request.getParameter("semester"));
	      
	      out.println("<table> <tr> <td style= \"width : 70px;\"> S.No </td> <td style= \"width : 150px;\"> Subject Code </td> <td style= \"width : 250px;\"> Subject Name </td> <td style= \"width : 100px;\"> Credits </td> <td> Grades </td> </tr>");
	     
	      for(int i=0;i<a.size();i++)
	      {
	    	  out.println("<tr> <td style= \"width : 70px;\">"+ (i+1) +"</td> <td style= \"width : 150px;\"> "+ a.get(i).get(0) +" </td> <td style= \"width : 250px;\"> "+ a.get(i).get(1) +" </td> <td style= \"width : 100px;\" id = \""+subjectcredit.get(i)+"\" value=\""+a.get(i).get(2)+"\"> "+ a.get(i).get(2) +" </td> <td> <select name = \""+no_subject.get(i)+"\" id = \""+no_subject.get(i)+"\" >\r\n <option > select </option>" + 
	    	  		"  <option value =\"O\"> O</option>\r\n" + 
	    	  		"  <option value =\"A+\"> A+</option>\r\n" + 
	    	  		"  <option value =\"A\"> A</option>\r\n" + 
	    	  		"  <option value =\"B+\"> B+</option>\r\n" + 
	    	  		"  <option value =\"B\"> B</option>\r\n" + 
	    	  		"  <option value =\"RA\"> RA</option>\r\n" + 
	    	  		"</select></td> </tr>");
	      }
	      out.println("</table>");
	}
}
