package com.eums.model.service;

import java.sql.SQLException;

import com.eums.model.dao.EmployeeDao;
import com.eums.model.dao.EmployeeDaoImpl;
import com.eums.model.entity.Employee;

public class LoginAuthenticationServiceImpl implements LoginAuthenticationService {

	EmployeeDao employeeDao = new EmployeeDaoImpl();

	@Override
	public String authenticateEmployee(Employee employee) throws SQLException {
		Employee employeeCheck = employeeDao.searchEmployeeRecord(employee.getEmployeeID());
		if(employeeCheck == null)
		{
			return "Employee Not Found Please Try Again!!";
		}
		else
		{
			if(employeeCheck.getEmployeePassword().equals(employee.getEmployeePassword()))
			{
				return "Welcome "+employee.getEmployeeName();
			}
			else
			{
				return "Incorrect Password Please Try Again";
			}
		}
	}

	@Override
	public String authenticateHR(Employee employee) throws SQLException {
		Employee employeeCheck = employeeDao.searchHRRecord(employee.getEmployeeID());
		if(employeeCheck == null)
		{
			return "HR Not Found Please Try Again!!";
		}
		else
		{
			if(employeeCheck.getEmployeePassword().equals(employee.getEmployeePassword()))
			{
				return "Welcome "+employee.getEmployeeName();
			}
			else
			{
				return "Incorrect Password Please Try Again";
			}
		}
	}
	
	@Override
	public String checkEmployeeType(String employeeId) throws SQLException {
		Employee employee = employeeDao.searchRecord(employeeId);
		return employee.getEmployeeType();
	}
}
