<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="hrtable.css" title="style" />
<link rel="stylesheet" type="text/css" href="hrbutton.css" title="style" />
<link rel="stylesheet" type="text/css" href="hrstyle.css" title="style" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approval Request</title>
</head>
<body>
<%@ include file="HRMenu.jsp" %><br><br>
<%if(session.getAttribute("requestedTraining").equals(0)){ %>
<center><h1>Approvals Done !</h1>
<center><h1>No Pending Requests</h1></center>
<%}
else{%>
<center><h1>Pending Requests After Approval</h1></center><br><br>
<table id="table">
<tr>
<th>Training ID</th>
<th>User ID</th>
<th>Enrollment Time</th>
</tr>
<c:forEach var="requested" items="${requestedTraining}">
<tr>
<td>${requested.tid}</td>
<td>${requested.eid}</td>
<td>${requested.dateWithTime}</td>
</tr>
</c:forEach></table><br><br>
<%} %>
</body>
</html>