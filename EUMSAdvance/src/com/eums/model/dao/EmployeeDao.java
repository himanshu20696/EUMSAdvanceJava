package com.eums.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.eums.model.entity.Employee;

public interface EmployeeDao {
	
	List<Employee> listAllRecords() throws SQLException;
	Employee searchRecord(String employeeId) throws SQLException;
	boolean insertRecord(Employee employee) throws SQLException;
	boolean deleteRecord(String employeeId) throws SQLException;
	boolean updateRecord(String employeeId,Employee newEmployee) throws SQLException;
	Employee searchEmployeeRecord(String employeeId) throws SQLException;
	Employee searchHRRecord(String employeeId) throws SQLException;
}
