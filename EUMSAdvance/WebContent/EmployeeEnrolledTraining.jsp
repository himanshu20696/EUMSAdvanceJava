<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css" title="style" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="midnightblue">
<%@include file="EmployeeMenu.jsp" %><br><br>
<center><h1>You Are Enrolled In Following Trainings</h1></center><br><br>
<table id="table">
	<tr>
		<th>Training ID</th>
		<th>Training Name</th>
		<th>Training Type</th>
		<th>Trainer Name</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Mandatory</th>
	</tr>
<c:forEach var="enrolledTraining" items="${enrolledTraining}">
	<tr>
		<td>${enrolledTraining.tid}</td>
		<td>${enrolledTraining.tname}</td>
		<td>${enrolledTraining.ttype}</td>
		<td>${enrolledTraining.trainername}</td>
		<td>${enrolledTraining.sdate}</td>
		<td>${enrolledTraining.edate}</td>
		<td>${enrolledTraining.mandatory}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>