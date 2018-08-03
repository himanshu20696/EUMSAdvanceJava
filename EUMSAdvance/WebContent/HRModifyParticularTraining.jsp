<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="hrtable.css" title="style" />
<link rel="stylesheet" type="text/css" href="hrbutton.css" title="style" />
<title>Modify Training</title>
</head>
<body bgcolor="royalblue">
<%@ include file="HRMenu.jsp" %>
<center><h1>Provide New Values</h1></center><br><br>
<form action="./HRModifyTrainingServlet" method="post">
<table id="table">
<tr>
	<th>Parameter</th>
	<th>Input</th>
</tr>
<tr>
	<td>Training ID : </td>
	<td><input type="text" name="tid" value="${trainingModify.tid}" readonly></td>
</tr>
<tr>
	<td>Training Name : </td>
	<td><input type="text" name="tname" value="${trainingModify.tname}"></td>
</tr>
<tr>
	<c:set var = "selectedTraining" value = "${trainingModify.ttype}"/>
	<td>Training Type : </td>
	<td><select name="trainingtype">
	<c:if test = "${selectedTraining == 'Technical'}">
		<option value="Technical" selected>Technical</option>
		<option value="HR">HR</option>
		<option value="QMS">QMS</option>
	</c:if>
	<c:if test = "${selectedTraining == 'HR'}">
		<option value="Technical">Technical</option>
		<option value="HR" selected>HR</option>
		<option value="QMS">QMS</option>
	</c:if>
	<c:if test = "${selectedTraining == 'QMS'}">
		<option value="Technical">Technical</option>
		<option value="HR">HR</option>
		<option value="QMS" selected>QMS</option>
	</c:if>
	</select></td>
</tr>
<tr>	
	<td>Trainer Name : </td>
	<td><input type="text" name="trainername" value="${trainingModify.trainername}"></td>
</tr>
<tr>	
	<td>Start Date : </td>
	<%long millis=System.currentTimeMillis();  
	java.sql.Date date=new java.sql.Date(millis); %>
	<td><input type="date" name="sdate" min="<%=date%> value="${trainingModify.sdate}"></td>
</tr>
<tr>
	<td>End Date : </td>
	<td><input type="date" name="edate" min="<%=date%> value="${trainingModify.edate}"></td>
</tr>
<tr>	
	<td>Max Capacity : </td>
	<td><input type="number" name="maxcapacity" min="5" max="50" value="${trainingModify.maxcapacity}"></td>
</tr>
<tr>
	<c:set var = "mandatory" value = "${trainingModify.mandatory}"/>	
 	<td>Mandatory : </td>
	<td>
	<c:if test = "${mandatory}">
	<input type="radio" name="mandatory" value="true" checked>True
	<input type="radio" name="mandatory" value="false">False
	</c:if>
	<c:if test = "${!mandatory}">
	<input type="radio" name="mandatory" value="true">True
	<input type="radio" name="mandatory" value="false" checked>False
	</c:if>
	</td>
</tr>
</table>
<center><input type="submit" id="button" value="Submit"></center>
</form>
</body>
</html>