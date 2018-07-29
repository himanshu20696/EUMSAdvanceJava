package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.entity.Feedback;
import com.eums.model.service.HRService;
import com.eums.model.service.HRServiceImpl;

/**
 * Servlet implementation class ViewFeedbackRequestServlet
 */
public class ViewFeedbackRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ViewFeedbackRequestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HRService hrService = new HRServiceImpl();
		String consolidatedFeedback=null;
		List<Feedback> detailedFeedback =null;
		if(request.getParameter("view").equals("consolidated"))
		{
			try {
				consolidatedFeedback=hrService.viewTrainingFeedbackConsolidated(Integer.parseInt(request.getParameter("tid")));
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("feedback", consolidatedFeedback);
		}
		else
		{
			try {
				detailedFeedback=hrService.viewTrainingFeedbackDetailed(Integer.parseInt(request.getParameter("tid")));
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("feedback", detailedFeedback);
		}
		response.sendRedirect("./DisplayFeedback.jsp");
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
