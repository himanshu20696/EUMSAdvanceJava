<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fill Feedback</title>
<link rel="stylesheet" type="text/css" href="table.css" title="style" />
</head>
<body bgcolor="midnightblue">
<%@include file="EmployeeMenu.jsp" %><br><br>
<%if (session.getAttribute("fillFeedback").equals(0)) {%>
<center><h1>You are not eligible for filling any Feedback at the Moment</h1></center>
<center><h1>You will be notified !</h1></center>
<%}
else if (session.getAttribute("fillFeedback").equals(1)){%>
<center><h1>Feedback submitted successfully</h1></center>
<center><h1>Thank you for the Feedback !</h1></center>
<%}
else {%>
<center><h1>Feedback for Training ID : ${fillFeedback}</h1></center>
<form action="./RetrieveFeedbackServlet" method="post">
<table id="table">
	<tr>
		<th>Parameter</th>
		<th>Rating</th>
	</tr>
	<tr>
		<td>Coverage of Topics</td>
		<td>
			<input type="radio" name="coverageoftopics" value="1">1
			<input type="radio" name="coverageoftopics" value="2">2
			<input type="radio" name="coverageoftopics" value="3">3
			<input type="radio" name="coverageoftopics" value="4">4
			<input type="radio" name="coverageoftopics" value="5">5
		</td>
	</tr>
	<tr>
		<td>Effectiveness of Course</td>
		<td>
			<input type="radio" name="effectivenessofcource" value="1">1
			<input type="radio" name="effectivenessofcource" value="2">2
			<input type="radio" name="effectivenessofcource" value="3">3
			<input type="radio" name="effectivenessofcource" value="4">4
			<input type="radio" name="effectivenessofcource" value="5">5
		</td>
	</tr>
	<tr>
		<td>Presentation Style</td>
		<td>
			<input type="radio" name="presentationstyle" value="1">1
			<input type="radio" name="presentationstyle" value="2">2
			<input type="radio" name="presentationstyle" value="3">3
			<input type="radio" name="presentationstyle" value="4">4
			<input type="radio" name="presentationstyle" value="5">5
		</td>
	</tr>
	<tr>
		<td>Pace Of Delivery</td>
		<td>
			<input type="radio" name="paceofdelivery" value="1">1
			<input type="radio" name="paceofdelivery" value="2">2
			<input type="radio" name="paceofdelivery" value="3">3
			<input type="radio" name="paceofdelivery" value="4">4
			<input type="radio" name="paceofdelivery" value="5">5
		</td>
	</tr>
	<tr>
		<td>Course Overall</td>
		<td>
			<input type="radio" name="courceoverall" value="1">1
			<input type="radio" name="courceoverall" value="2">2
			<input type="radio" name="courceoverall" value="3">3
			<input type="radio" name="courceoverall" value="4">4
			<input type="radio" name="courceoverall" value="5">5
		</td>
	</tr>
	<tr>
		<td>Trainer Overall</td>
		<td>
			<input type="radio" name="traineroverall" value="1">1
			<input type="radio" name="traineroverall" value="2">2
			<input type="radio" name="traineroverall" value="3">3
			<input type="radio" name="traineroverall" value="4">4
			<input type="radio" name="traineroverall" value="5">5
		</td>
	</tr>
</table><br><br>
<center><input type="submit" value="Submit" style="background-color: #ADD8E6;
    border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;"></center>
</form>
<%} %>
</body>
</html>