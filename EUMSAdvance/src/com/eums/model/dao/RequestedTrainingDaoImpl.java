package com.eums.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.eums.model.entity.RequestedTraining;
import com.eums.model.helper.DBConnection;

public class RequestedTrainingDaoImpl implements RequestedTrainingDao {

	@Override
	public boolean insertRecord(RequestedTraining requestedTraining) throws SQLException {
		Connection con=null; 
		PreparedStatement pst=null;
		con=DBConnection.getDBConnection();
		pst=con.prepareStatement("insert into requested_training"
				+ "(user__id,training__id,enrolledtime,accepted,notified,processed) "
				+ "values(?,?,?,?,?,?)");
		pst.setString(1, requestedTraining.getEid());
		pst.setInt(2, requestedTraining.getTid());
		pst.setTimestamp(3, requestedTraining.getDateWithTime());
		pst.setBoolean(4, requestedTraining.isAccepted());
		pst.setBoolean(5, requestedTraining.isNotified());
		pst.setBoolean(6, requestedTraining.isProcessed());

		int rows=pst.executeUpdate();
		if(rows <= 0)
			return false;

		return true;
	}

	@Override
	public List<RequestedTraining> listAllRecords() throws SQLException {
		Connection con=null; 
		Statement stmt=null;
		ArrayList<RequestedTraining> requestedTrainingDetails=new ArrayList<>();
		con=DBConnection.getDBConnection();
		stmt=con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from requested_training");
		RequestedTraining requestedTraining=null;

		while(rs.next()){
			int tid = rs.getInt("training__id");
			String eid = rs.getString("user__id");
			Timestamp enrolledTime = rs.getTimestamp("enrolledtime");
			Boolean accepted = rs.getBoolean("accepted");
			Boolean notified = rs.getBoolean("notified");
			Boolean processed = rs.getBoolean("processed");
			requestedTraining = new RequestedTraining(eid, tid, enrolledTime, accepted, notified, processed);
			requestedTrainingDetails.add(requestedTraining);
		}

		return requestedTrainingDetails;
	}

	@Override
	public boolean updateRecord(RequestedTraining newRequestedTraining) throws SQLException {
		Connection con=null; 
		PreparedStatement pst=null;
		con=DBConnection.getDBConnection();
		pst=con.prepareStatement("update requested_training set "
				+ "accepted=?,"
				+ "notified=?,"
				+ "processed=? "
				+ "where training__id=? and user__id=?");
		pst.setBoolean(1, newRequestedTraining.isAccepted());
		pst.setBoolean(2, newRequestedTraining.isNotified());
		pst.setBoolean(3, newRequestedTraining.isProcessed());
		pst.setInt(4, newRequestedTraining.getTid());
		pst.setString(5, newRequestedTraining.getEid());
		int rows = pst.executeUpdate();
		if(rows <= 0)
			return false;

		return true;
	}

	@Override
	public ArrayList<RequestedTraining> listPendingRecords() throws SQLException {
		Connection con=null; 
		Statement stmt=null;
		ArrayList<RequestedTraining> requestedTrainingDetails=new ArrayList<>();
		con=DBConnection.getDBConnection();
		stmt=con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from requested_training where processed=false");
		RequestedTraining requestedTraining=null;

		while(rs.next()){
			int tid = rs.getInt("training__id");
			String eid = rs.getString("user__id");
			Timestamp enrolledTime = rs.getTimestamp("enrolledtime");
			Boolean accepted = rs.getBoolean("accepted");
			Boolean notified = rs.getBoolean("notified");
			Boolean processed = rs.getBoolean("processed");
			requestedTraining = new RequestedTraining(eid, tid, enrolledTime, accepted, notified,processed);
			requestedTrainingDetails.add(requestedTraining);
		}

		return requestedTrainingDetails;
	}

}
