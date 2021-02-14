package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NgoDao;

/**
 * Servlet implementation class DonationList
 */
@WebServlet("/DonationList")
public class DonationList extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		
 		int id=Integer.parseInt(request.getParameter("id"));
 		
 		ArrayList<ArrayList<String>> a=new NgoDao().donationList(id);
 		ArrayList<String> b=new NgoDao().requestDetails(id);
 				
 		request.setAttribute("Donation-List", a);
 		request.setAttribute("Request Details", b);
 		getServletConfig().getServletContext().getRequestDispatcher("/donation-list.jsp").forward(request,response);
	}
}
