package com.eums.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.eums.model.entity.Employee;
import com.eums.model.entity.Feedback;
import com.eums.model.entity.RequestedTraining;
import com.eums.model.entity.Training;

public interface HRService {
	boolean createTrainingInCalender(Training training) throws SQLException;
	boolean modifyTrainingInCalender(int trainingId, Training newTraining) throws SQLException;
	ArrayList<Employee> viewEmployeeEnrolledForTraining(int trainingId) throws SQLException;
	void approveEnrollmentOfTraining() throws SQLException;
	List<Feedback> viewTrainingFeedbackDetailed(int trainingId) throws SQLException;
	String viewTrainingFeedbackConsolidated(int trainingId) throws SQLException;
	ArrayList<RequestedTraining> viewRequestedTraining() throws SQLException;
	void autoApproveOfMandateTraining() throws SQLException;
	LinkedHashMap<Integer, String> displayAvailableTrainingFeedback() throws SQLException;
	ArrayList<Training> viewTrainings() throws SQLException;
	Employee fetchHRDetails(String employeeId) throws SQLException;
}
