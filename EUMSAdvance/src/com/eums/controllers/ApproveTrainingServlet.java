package com.eums.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.eums.model.entity.RequestedTraining;
import com.eums.model.service.HRService;
import com.eums.model.service.HRServiceImpl;
import com.sun.xml.internal.ws.resources.HttpserverMessages;

/**
 * Servlet implementation class ApproveTrainingServlet
 */
public class ApproveTrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ApproveTrainingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		HRService hrService = new HRServiceImpl();
		ArrayList<RequestedTraining> requestedTraining = null;
		try {
			requestedTraining = hrService.viewRequestedTraining();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(requestedTraining.isEmpty())
			session.setAttribute("requestedTraining",0);
		else
			session.setAttribute("requestedTraining", requestedTraining);
		response.sendRedirect("./ApprovalRequest.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HRService hrService = new HRServiceImpl();
		ArrayList<RequestedTraining> requestedTraining = null;
		try {
			hrService.approveEnrollmentOfTraining();
			requestedTraining = hrService.viewRequestedTraining();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(requestedTraining==null)
			session.setAttribute("requestedTraining",0);
		else
			session.setAttribute("requestedTraining", requestedTraining);
		response.sendRedirect("./ApprovalResponse.jsp");
	}

}
