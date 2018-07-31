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
import com.eums.model.entity.Feedback;
import com.eums.model.service.EmployeeService;
import com.eums.model.service.EmployeeServiceImpl;


public class RetrieveFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RetrieveFeedbackServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		EmployeeService empService = new EmployeeServiceImpl();
		Employee employee = (Employee)session.getAttribute("employee");
		Feedback feedback = new Feedback(employee.getEmployeeID(), (Integer)(session.getAttribute("fillFeedback")), 
				 Integer.parseInt(request.getParameter("coverageoftopics")), Integer.parseInt(request.getParameter("effectivenessofcource")), 
				 Integer.parseInt(request.getParameter("presentationstyle")),Integer.parseInt(request.getParameter("paceofdelivery")), 
				 Integer.parseInt(request.getParameter("courceoverall")), Integer.parseInt(request.getParameter("traineroverall")));
		try {
			boolean inserted = empService.feedbackFilling(feedback);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("fillFeedback", 1);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FillFeedback.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
