package controller;


import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AchievementDao;
import model.Achievement;



/**
 * Servlet implementation class Achievement
 */
@WebServlet("/AddAchievement")
public class AddAchievement extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String registerNo=(String)session.getAttribute("registerNo");
		registerNo="18euit172";
		String type=request.getParameter("Type");
		if(type.equals("Others"))
			type=request.getParameter("Other");
		String host=request.getParameter("Host");
		Date date=Date.valueOf(request.getParameter("Date"));
		String awards=request.getParameter("Awards");
		if(awards.equals("Others"))
			awards=request.getParameter("OtherAward");
		String description=request.getParameter("Description");
		String certificate=request.getParameter("certificate");
		
		Achievement obj=new Achievement(registerNo,type,host,date,awards,description,certificate);
		new AchievementDao().save(obj);
		
		RequestDispatcher requestDispatcherObj =request.getRequestDispatcher("/add-achievement.jsp");
		requestDispatcherObj.forward(request, response);
	}
}