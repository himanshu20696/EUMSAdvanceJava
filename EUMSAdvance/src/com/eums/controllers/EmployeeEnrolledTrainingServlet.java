package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.entity.Employee;
import com.eums.model.entity.Training;
import com.eums.model.service.EmployeeService;
import com.eums.model.service.EmployeeServiceImpl;

public class EmployeeEnrolledTrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession(false);
		Employee employee = (Employee) httpSession.getAttribute("employee");
		EmployeeService employeeService = new EmployeeServiceImpl();
		ArrayList<Training> enrolledTraining = new ArrayList<>();
		try {
			enrolledTraining = employeeService.viewEnrolledTraining(employee.getEmployeeID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		httpSession.setAttribute("enrolledTraining", enrolledTraining);
		response.sendRedirect("./EmployeeEnrolledTraining.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
