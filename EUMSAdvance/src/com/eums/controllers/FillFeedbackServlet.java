package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;

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

/**
 * Servlet implementation class FillFeedbackServlet
 */
public class FillFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FillFeedbackServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		EmployeeService empService = new EmployeeServiceImpl();
		Employee employee = (Employee)session.getAttribute("employee");
		LinkedHashMap<Integer, String> hashmap = null;
		try {
			hashmap = empService.feedbackPopup(employee.getEmployeeID());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(hashmap.isEmpty())
		{
			session.setAttribute("fillFeedback", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("FillFeedback.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
//			Feedback feedback = new Feedback();
//			feedback.setEid(employee.getEmployeeID());
//			feedback.setTid(hashmap.keySet().iterator().next().intValue());
			session.setAttribute("fillFeedback", hashmap.keySet().iterator().next().intValue());
			RequestDispatcher dispatcher = request.getRequestDispatcher("FillFeedback.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
