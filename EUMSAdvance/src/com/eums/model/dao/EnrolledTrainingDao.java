package com.eums.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.eums.model.entity.EnrolledTraining;

public interface EnrolledTrainingDao {
	ArrayList<EnrolledTraining> listAllRecords() throws SQLException;
	boolean insertRecord(EnrolledTraining enrolledTraining) throws SQLException;
	EnrolledTraining searchRecord(String employeeId) throws SQLException;
	ArrayList<Integer> listEmployeeEnrolledTrainingRecords(String employeeId) throws SQLException;
	ArrayList<Integer> listAllDistinctTrainings() throws SQLException;
}
