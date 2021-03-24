package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AchievementDao;


/**
 * Servlet implementation class DeleteAchievement
 */
@WebServlet("/DeleteAchievement")
public class DeleteAchievement extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("delete_id"));
		
		new AchievementDao().delete(id);
		
		RequestDispatcher requestDispatcherObj =request.getRequestDispatcher("/delete-achievement.jsp");
		requestDispatcherObj.forward(request, response);
	}
}
