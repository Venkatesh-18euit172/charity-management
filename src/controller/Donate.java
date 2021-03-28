package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Donation;
import service.DonorDao;

/**
 * Servlet implementation class Donate
 */
@WebServlet("/Donate")
public class Donate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
   		HttpSession session=request.getSession();
   		String donation_details[]=request.getParameter("details").split("\\?");
   		
	   	String ngo_email=donation_details[0];
	 	String donor_email=(String)session.getAttribute("donormailid");
	 	int donated_quantity=Integer.parseInt(donation_details[1]);
	 	String measurements=donation_details[2];
	 	int donation_id=Integer.parseInt(donation_details[3]);
	 	Date donated_date=Date.valueOf(donation_details[4]);

   		Donation donation=new Donation(ngo_email, donor_email, donated_quantity, measurements, donation_id, donated_date,"waiting");
   		
   		new DonorDao().donate(donation);
	}
}