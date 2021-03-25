package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.NgoDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String emailid=request.getParameter("mailid");
		String password=request.getParameter("password");
		String typeofuser=request.getParameter("user");
		
		HttpSession session=request.getSession();
		
		
		
		NgoDao obj=new NgoDao();
		if(obj.checkLogin(emailid, password,typeofuser))
		{
			if(typeofuser.equals("ngo"))
			{   
				session.setAttribute("ngomailid",emailid);
				response.sendRedirect("ngo-dashboard.jsp");
			}
				
			else if(typeofuser.equals("donor"))
				{
				session.setAttribute("donormailid",emailid);
				response.sendRedirect("donor-dashboard.jsp");
				}
				
			else
				response.sendRedirect("login.jsp?flag=1");
		}
		else
		{
			response.sendRedirect("login.jsp?flag=1");
		}
		
		
	}
		

}
