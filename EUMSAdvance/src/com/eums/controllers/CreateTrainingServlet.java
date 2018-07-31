package com.eums.controllers;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eums.model.entity.Training;
import com.eums.model.service.HRService;
import com.eums.model.service.HRServiceImpl;

/**
 * Servlet implementation class CreateTrainingServlet
 */
public class CreateTrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateTrainingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		HRService hrService = new HRServiceImpl();
		Training training = new Training();
		training.setTname(request.getParameter("tname"));
		training.setTtype(request.getParameter("ttype"));
		training.setTrainername(request.getParameter("trainername"));
		training.setEdate(Date.valueOf(request.getParameter("sdate")));
		training.setSdate(Date.valueOf(request.getParameter("edate")));
		training.setMaxcapacity(Integer.parseInt(request.getParameter("maxcapacity")));
		training.setAvailablecapacity(Integer.parseInt(request.getParameter("maxcapacity")));
		training.setMandatory(Boolean.parseBoolean(request.getParameter("mandatory")));
		boolean created=false;
		try {
			created=hrService.createTrainingInCalender(training);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("created", created);
		response.sendRedirect("./TrainingCreated.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
