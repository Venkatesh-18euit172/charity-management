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

/**
 * Servlet implementation class CgpaController3
 */
@WebServlet("/CgpaGraph")
public class CgpaController3 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		  CgpaDao obj=new CgpaDao();
	      response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      									//from session take the value of register number
	      ArrayList<Double> cgpa=obj.getCgpa("18euit172");
	      String details="";
	      for(int i=0;i<cgpa.size();i++)
	      {
	    	  if(i==cgpa.size()-1)
	    		  details+=cgpa.get(i);
	    	  else
	    		  details+=cgpa.get(i)+",";
	      }
	      out.println(details);
	}
}