package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.entity.Training;
import com.eums.model.service.HRService;
import com.eums.model.service.HRServiceImpl;

/**
 * Servlet implementation class ViewTrainingServlet
 */
public class ViewTrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewTrainingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		HRService hrService = new HRServiceImpl();
		ArrayList<Training> trainingList = null;
		try {
			trainingList = hrService.viewTrainings();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(trainingList.isEmpty())
		{
			session.setAttribute("traininglist", 0);
			response.sendRedirect("./ViewTrainings.jsp");
		}
		else
		{
			session.setAttribute("traininglist", trainingList);
			response.sendRedirect("./ViewTrainings.jsp");

		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
