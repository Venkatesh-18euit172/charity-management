package controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.FacultyDao;
import model.Faculty;

/**
 * Servlet implementation class FacultyUpload
 */
@WebServlet("/FacultyUpload")
@MultipartConfig
public class FacultyUpload extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Part filePart = request.getPart("faculty-file"); 
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); 
	    InputStream fileContent = filePart.getInputStream();
	   
	    String a[]=new String(fileContent.readAllBytes()).split(",");
	    String temp=a[0].substring(3);
	    for(int i=0;i+1<a.length;i=i+3)
	    {
	    	String facultyId=temp;
	    	String name=a[i+1];
	    	String department=a[i+2];
	    	String b[]=a[i+3].split("\\r?\\n");
	    	String phone=b[0];
	    	if(b.length==2)
	    		temp=b[1];
	    	Faculty model=new Faculty(facultyId, name, department , phone);
	    	new FacultyDao().save(model);
	    }
	}
}