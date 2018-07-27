<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css" title="style" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<% HashMap<Integer, Boolean> selectedTraining = new HashMap<>();
   selectedTraining = (HashMap<Integer, Boolean>)request.getAttribute("selectedTraining");
   if(selectedTraining != null)
   {
	   Set<Integer> keys = selectedTraining.keySet();
	   for(Integer i:keys){
		   Boolean res = selectedTraining.get(i);
		   if(res){
			  %>
	        	<script type="text/javascript">
				document.getElementById('error').innerHTML = "Request For Training ID "+'<%= i %>'+" Has Been Send To HR. Please Wait For Comformation";
				</script>
	          <% 
		   }
		   else{
			   %>
	        	<script type="text/javascript">
				document.getElementById('error').innerHTML = "You Request For Training ID "+'<%= i %>'+" Has Been Rejected As You Are Already Enrolled For A Training In That Period";
				</script>
	          <%
		   }
	   }		
    }
%>
</head>
<body bgcolor="midnightblue">
<%@include file="EmployeeMenu.jsp" %><br><br>
<center><h1>Upcoming Training</h1></center><br><br>
<form action="./EmployeeRequestTrainingServlet" method="post">
<table id="table">
	<tr>
		<th></th>
		<th>Training ID</th>
		<th>Training Name</th>
		<th>Training Type</th>
		<th>Trainer Name</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Maximum Capacity</th>
		<th>Available Capacity</th>
	</tr>
<c:forEach var="viewUpcomingTraining" items="${viewUpcomingTraining}">
	<tr>
		<td><input type="checkbox" name="enroll" value="${viewUpcomingTraining.tid}"></td>
		<td>${viewUpcomingTraining.tid}</td>
		<td>${viewUpcomingTraining.tname}</td>
		<td>${viewUpcomingTraining.ttype}</td>
		<td>${viewUpcomingTraining.trainername}</td>
		<td>${viewUpcomingTraining.sdate}</td>
		<td>${viewUpcomingTraining.edate}</td>
		<td>${viewUpcomingTraining.maxcapacity}</td>
		<td>${viewUpcomingTraining.availablecapacity}</td>
	</tr>
</c:forEach>
</table>
<center><input type="submit" value="Enroll For Training" style="background-color: #ADD8E6;
    border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;"></center>
</form><br><br>
<div id="error" style="text-align: center;position: absolute;bottom:0px;left:0;width:100%;background: yellow; color:midnightblue"></div>
</body>
</html>