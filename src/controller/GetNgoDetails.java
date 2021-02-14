package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ngo;
import service.NgoDao;

/**
 * Servlet implementation class GetNgoDetails
 */
@WebServlet("/GetNgoDetails")
public class GetNgoDetails extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	PrintWriter out=response.getWriter();
    	String email=request.getParameter("email");
    	NgoDao obj=new NgoDao();
    	Ngo ngodetail=obj.getNgo(email);
    	
    	String details=ngodetail.getUser_email();
    	details+="||"+ngodetail.getName();
    	details+="||"+ngodetail.getAddress();
    	details+="||"+ngodetail.getMobile_Number();
    	details+="||"+ngodetail.getDocument_Link();
    	
    	out.println(details);
	}
}