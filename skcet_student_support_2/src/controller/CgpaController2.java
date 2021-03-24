package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import process.CalculateCgpa;

/**
 * Servlet implementation class CgpaController2
 */
@WebServlet("/CgpaCalculate")
public class CgpaController2 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	      response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      ArrayList<String> no_subject=new ArrayList<String>();
	      no_subject.add("one");no_subject.add("two");no_subject.add("three");no_subject.add("four");
	      no_subject.add("five");no_subject.add("six");no_subject.add("seven");no_subject.add("eight");
	      
	      ArrayList<String> subjectcredit=new ArrayList<String>();
	      subjectcredit.add("onecredit");subjectcredit.add("twocredit");subjectcredit.add("threecredit");subjectcredit.add("fourcredit");
	      subjectcredit.add("fivecredit");subjectcredit.add("sixcredit");subjectcredit.add("sevencredit");subjectcredit.add("eightcredit");
	      
	      double total=0;
	      
	      for(int i=0;i<8;i++)
	      {
  	    	  
	      }
	      
	      CalculateCgpa obj=new CalculateCgpa();
	     // Double total_cgpa=obj.calculate(grades);
	     // out.println(total_cgpa);
	}
}