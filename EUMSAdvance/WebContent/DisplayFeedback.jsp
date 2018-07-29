<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Feedback</title>
<link rel="stylesheet" type="text/css" href="hrtable.css" title="style" />
<link rel="stylesheet" type="text/css" href="hrbutton.css" title="style" />
<link rel="stylesheet" type="text/css" href="hrstyle.css" title="style" />
</head>
<body>
<%@ include file="HRMenu.jsp" %>
<% if(session.getAttribute("feedback").getClass().equals(String.class)) {%>
<center><h3>${feedback}</h3></center>
<%}
else {%>
<center><h3>Detailed Feedback for Training ID : ${feedback[0].tid}</h3></center>
<table id="table">
<tr>
	<th>Employee ID</th>
	<th>Coverage of Topics</th>
	<th>Effectiveness of Course</th>
	<th>Presentation Style</th>
	<th>Pace of Delivery</th>
	<th>Course Overall</th>
	<th>Trainer Overall</th>
</tr>
<c:forEach var="fb" items="${feedback}">
<tr>
	<td>${fb.eid}</td>
	<td>${fb.coverageoftopics}</td>
	<td>${fb.effectivenessofcource}</td>
	<td>${fb.presentationstyle}</td>
	<td>${fb.paceofdelivery}</td>
	<td>${fb.courceoverall}</td>
	<td>${fb.traineroverall}</td>
</tr>
</c:forEach>
</table>
<%} %>
</body>
</html>