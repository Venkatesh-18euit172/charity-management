package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NgoDao;

/**
 * Servlet implementation class ReceivedDonation
 */
@WebServlet("/ReceivedDonation")
public class ReceivedDonation extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a[]=request.getParameter("id").split(",");
		int id=Integer.parseInt(a[0]);
		String b[]=a[1].split(" ");
		int donatedquantity=Integer.parseInt(b[0]);
		new NgoDao().acceptedDonation(id,donatedquantity);
		
		
	}

}
