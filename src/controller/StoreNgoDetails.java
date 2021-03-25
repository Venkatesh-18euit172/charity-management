package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Ngo;
import service.StoreDetails;

/**
 * Servlet implementation class StoreNgoDetails
 */
@WebServlet("/StoreNgoDetails")
public class StoreNgoDetails extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
		StoreDetails obj=new StoreDetails();
		String details[]=request.getParameter("ngodetailsentered").split("\\?");
		HttpSession session=request.getSession();
		Ngo obj1=new Ngo(details[0],details[1],details[2],details[3],details[4],(String)session.getAttribute("password"));
		obj.storeNgoDetails(obj1);
		
		
	}

}
