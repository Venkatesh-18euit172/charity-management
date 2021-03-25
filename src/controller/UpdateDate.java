package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import service.RequestDao;

/**
 * Servlet implementation class UpdateDate
 */
@WebServlet("/UpdateDate")
public class UpdateDate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a[]=request.getParameter("id").split("\\?");
		int id=Integer.parseInt(a[0]);
		Date date=Date.valueOf(a[1]);
		new RequestDao().updateRequest(date,id);//date,id
		
	}

}
