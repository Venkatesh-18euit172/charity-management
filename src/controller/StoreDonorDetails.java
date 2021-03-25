package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Donor;
import model.Ngo;
import service.StoreDetails;


@WebServlet("/StoreDonorDetails")
public class StoreDonorDetails extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		StoreDetails obj=new StoreDetails();
	//	System.out.println(request.getParameter("donordetailsentered"));
		String details[]=request.getParameter("donordetailsentered").split("\\?");
		Donor obj1=new Donor(details[0],details[1],details[2],details[3]);
		obj.storeDonorDetails(obj1);
	}

}
