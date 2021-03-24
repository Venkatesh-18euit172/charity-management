package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AchievementDao;


/**
 * Servlet implementation class FacultyAchievement
 */
@WebServlet("/FacultyAchievement")
public class FacultyAchievement extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  AchievementDao obj=new AchievementDao();
	      response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
		
	      String s[]=request.getParameter("from").split("\\?");
	      String from=s[0];
	      String to=s[1];
	      ArrayList<Integer> a=obj.getAchievement(from, to);
	      String details="";
	      for(int i=0;i<a.size();i++)
	      {
	    	  if(i==a.size()-1)
	    		  details+=a.get(i);
	    	  else
	    		  details+=a.get(i)+"||";
	      }
	      out.println(details);
	      
	}
}