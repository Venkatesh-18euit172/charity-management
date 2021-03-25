package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Request;
import service.RequestDao;

/**
 * Servlet implementation class AddRequest
 */
@WebServlet("/AddRequest")
public class AddRequest extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		ArrayList<Request> req=new ArrayList<Request>();
		int count=Integer.parseInt(request.getParameter("no_of_request"));
		for(int i=0;i<count;i++)
		{
			
			String ngo_email=(String)session.getAttribute("mailid");
			String type_of_request=request.getParameter("request_"+i);
			int total_quantity=Integer.parseInt(request.getParameter("quantity_"+i));
			String measurements=request.getParameter("measurement_"+i);
			Date expected_date=Date.valueOf(request.getParameter("date_"+i));
			String request_details=request.getParameter("description_"+i);
			String status="waiting";
			Request obj=new Request(0,ngo_email, type_of_request, total_quantity,total_quantity, measurements, expected_date, request_details, status);
			req.add(obj);
		}
		
		RequestDao obj=new RequestDao();
		obj.storeRequest(req);
		
		response.sendRedirect("request.jsp");
	}
}