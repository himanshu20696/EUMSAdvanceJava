package com.eums.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.eums.model.entity.Training;

public interface TrainingDao {
	ArrayList<Training> listAllRecords() throws SQLException;
	Training searchRecord(int tId) throws SQLException;
	boolean insertRecord(Training training) throws SQLException;
	boolean deleteRecord(int tId) throws SQLException;
	boolean updateRecord(int tId,Training newTraining) throws SQLException;
}
