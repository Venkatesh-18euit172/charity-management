package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CgpaDao;
import model.Cgpa;

/**
 * Servlet implementation class AddSubject
 */
@WebServlet("/AddSubject")
public class AddSubject extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<Cgpa> a=new ArrayList<Cgpa>();
		int semester=Integer.parseInt(request.getParameter("semester"));
		int no_of_Subject=Integer.parseInt(request.getParameter("subject"));
		for(int i=0;i<no_of_Subject;i++)
		{
			String subjectCode=request.getParameter("subject_code_"+i);
			String subjectName=request.getParameter("subject_"+i);
			double credits=Double.parseDouble(request.getParameter("credits_"+i));
			Cgpa obj=new Cgpa(semester, subjectCode, subjectName, credits);
			a.add(obj);
		}
		CgpaDao obj=new CgpaDao();
		obj.deleteSubjects(semester);
		obj.storeSubjects(a);
	}
}
