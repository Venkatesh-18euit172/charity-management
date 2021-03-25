package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.StoreDetails;

/**
 * Servlet implementation class TypeOfUser
 */
@WebServlet("/TypeOfUser")
public class TypeOfUser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String typeofuser=request.getParameter("user");
		String emailid=request.getParameter("mailid");
		String password=request.getParameter("password");
		
		HttpSession session=request.getSession();
		session.setAttribute("mailid",emailid);
		session.setAttribute("password",password);
		if(typeofuser.equals("ngo"))
		{   
			
			response.sendRedirect("ngodetails.jsp");
			
		}
			
		else if(typeofuser.equals("donor"))
		{
			new StoreDetails().login(emailid, password, typeofuser);
			response.sendRedirect("donordetails.jsp");
		}
			
	}

}
