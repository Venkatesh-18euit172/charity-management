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
 * Servlet implementation class SuccessfulDonorList
 */
@WebServlet("/SuccessfulDonorList")
public class SuccessfulDonorList extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

 		int id=Integer.parseInt(request.getParameter("id"));
 		//System.out.println(id);
 		ArrayList<ArrayList<String>> a=new NgoDao().donationList(id);
 		ArrayList<String> b=new NgoDao().requestDescription(id);
 				
 		request.setAttribute("Donation-List", a);
 		request.setAttribute("Request Details", b);
 		getServletConfig().getServletContext().getRequestDispatcher("/donation-list.jsp").forward(request,response);
	}

}
