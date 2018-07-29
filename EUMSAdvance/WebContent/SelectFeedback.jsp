<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Feedback</title>
<link rel="stylesheet" type="text/css" href="hrtable.css" title="style" />
<link rel="stylesheet" type="text/css" href="hrbutton.css" title="style" />
</head>
<body bgcolor="royalblue">
<%@include file="HRMenu.jsp" %>
<% if(session.getAttribute("availablefeedback").equals(0)) 
{%>
<center><h1>No Feedbacks Available at the Moment !</h1></center>
<% }
else {%>
<form action="./ViewFeedbackRequestServlet" method="post">
<table id="table">
<tr>
	<th>Parameter</th>
	<th>Value</th>
</tr>
<tr>
	<td>Feedback</td> 
	<td>
	<select name="tid">
	<c:forEach var="feedback" items="${availablefeedback}">
        <option value="${feedback.key}"><c:out value="${feedback.key} : ${feedback.value}"/></option>
	</c:forEach>
	</select>
	</td>
</tr>
<tr>
	<td>
	View
	</td>
	<td>
	<input type="radio" name="view" value="consolidated">Consolidated
	<input type="radio" name="view" value="detailed">Detailed<br><br>
	</td>
</tr>
</table>
<center><input type="submit" id="button" value="Submit"></center>
</form>
<%} %>
</body>
</html>