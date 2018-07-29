package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.service.HRService;
import com.eums.model.service.HRServiceImpl;

/**
 * Servlet implementation class ViewAvailableFeedbackServlet
 */
public class ViewAvailableFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewAvailableFeedbackServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		HRService hrService = new HRServiceImpl();
		LinkedHashMap<Integer, String> hashmap = null;
		try {
			hashmap = hrService.displayAvailableTrainingFeedback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(hashmap.isEmpty())
		{
			session.setAttribute("availablefeedback", 0);
		}
		else
		{
			session.setAttribute("availablefeedback", hashmap);
		}
			response.sendRedirect("./SelectFeedback.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
