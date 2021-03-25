package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.DonorDao;

import java.util.Map;
import java.util.TreeMap;
/**
 * Servlet implementation class DonationPiechart
 */
@WebServlet("/DonationPiechart")
public class DonationPiechart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
   		HttpSession session=request.getSession();
   		String mailid=(String)session.getAttribute("donormailid");
   		TreeMap<String,Integer> a=new DonorDao().showPiechart(mailid);
   		String details="";
   		for(Map.Entry<String, Integer> i:a.entrySet())
   		{
   			details+=i.getKey()+"-"+i.getValue()+"||";
   		}
   		PrintWriter out=response.getWriter();
   		out.println(details);
	}
}
