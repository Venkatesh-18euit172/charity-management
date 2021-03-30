package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NgoDao;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String emailid=request.getParameter("mailid");
		String password=request.getParameter("password");
		
		if(emailid.equals("admin@gmail.com") && password.equals("charity"))
		{
			
		   response.sendRedirect("admin-dashboard.jsp");
		}
		else
		{
			response.sendRedirect("admin-login.jsp");
		}
	}
}