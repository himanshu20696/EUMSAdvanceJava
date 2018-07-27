package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.entity.Employee;
import com.eums.model.service.EmployeeService;
import com.eums.model.service.EmployeeServiceImpl;

public class EmployeeRequestTrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession(false);
		Employee employee = (Employee) httpSession.getAttribute("employee");
		String[] selectedTraining = request.getParameterValues("enroll");
		List<String> selectedTrainingList = Arrays.asList(selectedTraining);
		EmployeeService employeeService = new EmployeeServiceImpl();
		HashMap<Integer, Boolean> resultMap = new HashMap<>();
		for(String s:selectedTrainingList)
		{
			int trainingId = Integer.parseInt(s);
			boolean result = false;
			try {
				result = employeeService.enrollForTraining(trainingId, employee.getEmployeeID());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resultMap.put(trainingId, result);
		}
		httpSession.setAttribute("selectedTraining", resultMap);
		response.sendRedirect("./EmployeeViewUpcommingTraining.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
