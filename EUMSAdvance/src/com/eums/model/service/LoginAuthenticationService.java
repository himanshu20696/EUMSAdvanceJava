package com.eums.model.service;

import java.sql.SQLException;

import com.eums.model.entity.Employee;

public interface LoginAuthenticationService {
	String authenticateEmployee(Employee employee) throws SQLException;
	String authenticateHR(Employee employee) throws SQLException;
	String checkEmployeeType(String employeeId) throws SQLException;
}
