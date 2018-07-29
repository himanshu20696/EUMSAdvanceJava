<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="hrtable.css" title="style" />
<title>View Trainings</title>
</head>
<body bgcolor="royalblue">
<%@ include file="HRMenu.jsp" %>
<% if(session.getAttribute("traininglist").equals(0)) {%>
<center><h1>No Trainings Scheduled!</h1></center>
<%}
else {%>
<table id="table">
<tr>
	<th>Training ID</th>
	<th>Training Name</th>
	<th>Training Type</th>
	<th>Trainer Name</th>
	<th>Start Date</th>
	<th>End Date</th>
	<th>Max Capacity</th>
	<th>Available Capacity</th>
	<th>Mandatory</th>
</tr>
<c:forEach var="training" items="${traininglist}">
<tr>
	<td>${training.tid}</td>
	<td>${training.tname}</td>
	<td>${training.ttype}</td>
	<td>${training.trainername}</td>
	<td>${training.sdate}</td>
	<td>${training.edate}</td>
	<td>${training.maxcapacity}</td>
	<td>${training.availablecapacity}</td>
	<td>${training.mandatory}</td>
</tr>
</c:forEach>
</table>
<%} %>	
</body>
</html>