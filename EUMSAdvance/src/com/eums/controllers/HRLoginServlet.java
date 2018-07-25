package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.entity.Employee;
import com.eums.model.service.HRService;
import com.eums.model.service.HRServiceImpl;
import com.eums.model.service.LoginAuthenticationService;
import com.eums.model.service.LoginAuthenticationServiceImpl;

public class HRLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String employeeID = request.getParameter("username");
		String employeePassword = request.getParameter("password");
		Employee employee = new Employee();
		employee.setEmployeeID(employeeID);
		employee.setEmployeePassword(employeePassword);
		LoginAuthenticationService authenticationService = new LoginAuthenticationServiceImpl();
		String result = null;
		try {
			result = authenticationService.authenticateHR(employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result.equalsIgnoreCase("HR Not Found Please Try Again!!")
				|| result.equalsIgnoreCase("Incorrect Password Please Try Again"))
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("./Login.jsp");
			request.setAttribute("result", result);
			requestDispatcher.forward(request, response);
		}
		else
		{
			HttpSession httpSession = request.getSession();
			HRService hrService = new HRServiceImpl();
			Employee employeeDetails = null;
			try {
				employeeDetails = hrService.fetchHRDetails(employeeID);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			httpSession.setAttribute("employee", employeeDetails);
			response.sendRedirect("./HRScreen.jsp");
		}
		
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
