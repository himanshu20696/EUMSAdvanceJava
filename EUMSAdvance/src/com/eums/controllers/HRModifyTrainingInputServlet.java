package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.entity.Employee;
import com.eums.model.entity.Training;
import com.eums.model.service.HRService;
import com.eums.model.service.HRServiceImpl;

public class HRModifyTrainingInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession(false);
		Employee employee = (Employee) httpSession.getAttribute("employee");
		String trainindIdString = request.getParameter("modify");
		int trainingId = Integer.parseInt(trainindIdString);
		HRService hrService = new HRServiceImpl();
		Training training = null;
		try {
			training = hrService.fetchTrainingDetails(trainingId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		httpSession.setAttribute("trainingModify", training);
		response.sendRedirect("./HRModifyParticularTraining.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
