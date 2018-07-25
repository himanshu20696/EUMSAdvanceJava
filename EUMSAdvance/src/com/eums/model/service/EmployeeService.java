package com.eums.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.eums.model.entity.Employee;
import com.eums.model.entity.Feedback;
import com.eums.model.entity.Training;

public interface EmployeeService {
	ArrayList<Training> viewUpcommingTraining(String employeeId) throws SQLException;
	ArrayList<Training> viewEnrolledTraining(String employeeId) throws SQLException;
	boolean enrollForTraining(int trainingId, String employeeId) throws SQLException;
	boolean feedbackFilling(Feedback feedback) throws SQLException;
	int feedbackEligibilityCheck(int trainingId, String employeeId) throws SQLException;
	void feedbackDisablement(String employeeId) throws SQLException;
	LinkedHashMap<Integer, String> feedbackPopup(String employeeID) throws SQLException;
	LinkedHashMap<String, Boolean> notificationOfEnrollment(String employeeId) throws SQLException;
	boolean checkIfEmployeeEnrolledToAnyTraining(String employeeId) throws SQLException;
	Employee fetchEmployeeDetails(String employeeId) throws SQLException;
}
