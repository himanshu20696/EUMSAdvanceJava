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

public class HRModifyTrainingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		HRService hrService = new HRServiceImpl();
		Training training = new Training();
		training.setTid(Integer.parseInt(request.getParameter("tid")));
		training.setTname(request.getParameter("tname"));
		training.setTtype(request.getParameter("trainingtype"));
		System.out.println(request.getParameter("trainingtype"));
		training.setTrainername(request.getParameter("trainername"));
		training.setSdate(Date.valueOf(request.getParameter("sdate")));
		training.setEdate(Date.valueOf(request.getParameter("edate")));
		training.setMaxcapacity(Integer.parseInt(request.getParameter("maxcapacity")));
		training.setAvailablecapacity(Integer.parseInt(request.getParameter("maxcapacity")));
		training.setMandatory(Boolean.parseBoolean(request.getParameter("mandatory")));
		boolean modified=false;
		try {
			modified=hrService.modifyTrainingInCalender(training.getTid(), training);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("modified", modified);
		response.sendRedirect("./TrainingModified.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
