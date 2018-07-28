package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
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
		HashMap<Integer, String> resultMap = new HashMap<>();
		for(String s:selectedTrainingList)
		{
			int flag = 0;
			int trainingId = Integer.parseInt(s);
			boolean result = false;
			String outcome = null;
			try {
				result = employeeService.enrollForTraining(trainingId, employee.getEmployeeID());
				flag = 1;
			} catch (SQLException e) {
				e.printStackTrace();
				outcome = "alreadyrequested";
				flag = 2;
			}
			System.out.println(result);
			if(result && flag==1)
				outcome = "requested";
			else if(!result && flag==1)
				outcome = "rejected";
			System.out.println(outcome);
			resultMap.put(trainingId, outcome);
		}
		httpSession.setAttribute("selectedTraining", resultMap);
		response.sendRedirect("./EmployeeViewUpcommingTraining.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
