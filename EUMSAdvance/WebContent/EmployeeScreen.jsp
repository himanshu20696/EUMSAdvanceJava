<%@page import="java.util.*"%>
<%@page import="com.eums.model.entity.Employee"%>
<%@page import="com.eums.model.service.EmployeeServiceImpl"%>
<%@page import="com.eums.model.service.EmployeeService"%>
<%@page import="com.eums.model.service.HRServiceImpl"%>
<%@page import="com.eums.model.service.HRService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css" title="style" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
#head{
background-color:#add8e6;}</style>
<body bgcolor="midnightblue">
<%@include file="EmployeeMenu.jsp" %>
<img src="images/userimage.png" id="userimage" style="position:absolute;left:16%;top:20%;height:200px;width:200px;">
<table border="1" style="position:absolute;left:35%;top:18%">
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
<%
HRService hrService = new HRServiceImpl();
EmployeeService employeeService = new EmployeeServiceImpl();
Employee employee = (Employee) session.getAttribute("employee");
hrService.autoApproveOfMandateTraining();
employeeService.feedbackDisablement(employee.getEmployeeID());
%>
<div style="position:absolute;left:60%;top:18%">
<h1>Notifications</h1><br>
<%
LinkedHashMap<Integer, String> feedbackPopup = new LinkedHashMap<>();
feedbackPopup = employeeService.feedbackPopup(employee.getEmployeeID());
Set<Integer> keys = feedbackPopup.keySet();
for(Integer trainingId:keys)
{
%>
<h4>Please Fill Feedback For <%= feedbackPopup.get(trainingId)%> Having Training ID <%=trainingId %></h4><br>
<%
}
%>

<%
LinkedHashMap<String, Boolean> notification = new LinkedHashMap<>();
notification = employeeService.notificationOfEnrollment(employee.getEmployeeID());
Set<String> notikeys = notification.keySet();
for(String trainings:notikeys)
{
%>
<h4>Your Training Request for <%= trainings %></h4>
<%
if(notification.get(trainings))
{
%>
<h4> Has Been Approved</h4><br>
<%	
}
else
{
%>	
<h4> Has Been Declined</h4><br>
<%	
}
}
%>
</div>
</body>
</html>