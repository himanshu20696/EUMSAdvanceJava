<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="hrstyle.css" title="style" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HR Screen</title>
</head>
<style>
#head{
background-color:midnightblue;
color:white;}</style>
<body bgcolor="royalblue">
<%@include file="HRMenu.jsp" %>
<img src="images/userimage.png" id="userimage" style="position:absolute;left:16%;top:20%;height:200px;width:200px;">
<table border="1" style="position:absolute;left:45%;top:18%">
	<tr>
		<td id="head">Employee ID</td>
		<td>${employee.employeeID}</td>
	</tr>
	<tr>
		<td id="head">Name</td>
		<td>${employee.employeeName}</td>
	</tr>
	<tr>
		<td id="head">E-mail</td>
		<td>${employee.employeeEmail}</td>
	</tr>
	<tr>
		<td id="head">Team</td>
		<td>${employee.employeeTeam}</td>
	</tr>
	<tr>
		<td id="head">Address</td>
		<td>${employee.employeeAddress}</td>
	</tr>
	<tr>
		<td id="head">Contact No.</td>
		<td>${employee.employeeContactNo}</td>
	</tr>
</table>
</body>
</html>
