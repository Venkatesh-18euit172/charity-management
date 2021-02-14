package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NgoDao;

/**
 * Servlet implementation class DeleteNgo
 */
@WebServlet("/DeleteNgo")
public class DeleteNgo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
  		String email=request.getParameter("email");
    	NgoDao obj=new NgoDao();
    	obj.delete(email);	
	}
}
