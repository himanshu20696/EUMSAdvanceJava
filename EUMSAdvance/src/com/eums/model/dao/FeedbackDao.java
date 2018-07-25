package com.eums.model.dao;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import com.eums.model.entity.Feedback;

public interface FeedbackDao {
	
	boolean insertFeedback(Feedback feedback) throws SQLException;
	List<Feedback> listDetailedFeedback(int trainingId) throws SQLException;
	String listConsolidatedFeedback(int trainingId) throws SQLException;
	boolean updateRecord(String employeeId, int trainingId, Feedback newFeedback) throws SQLException;
	int searchRecord(String employeeId, int trainingId) throws SQLException;
	LinkedHashMap<Integer, String> viewAvailableTrainingFeedback() throws SQLException;
}
