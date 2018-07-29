<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Training</title>
<link rel="stylesheet" type="text/css" href="hrtable.css" title="style" />
</head>
<body bgcolor="royalblue">
<%@ include file="HRMenu.jsp" %>
<form action="./CreateTrainingServlet" method="post">
<table id="table">
<tr>
	<th>Parameter</th>
	<th>Input</th>
</tr>
<tr>
	<td>Training Name : </td>
	<td><input type="text" name="tname"></td>
</tr>
<tr>
	<td>Training Type : </td>
	<td><select name="ttype">
	<option value="Technical">Technical</option>
	<option value="HR">HR</option>
	<option value="QMS">QMS</option></select></td>
</tr>
<tr>
	<td>Trainer Name : </td>
	<td><input type="text" name="trainername"></td>
</tr>
<tr>
	<td>Start Date : </td>
	<%long millis=System.currentTimeMillis();  
	java.sql.Date date=new java.sql.Date(millis); %>
	<td><input type="date" name="sdate" min="<%=date%>"></td>
</tr>
<tr>
	<td>End Date : </td>
	<td><input type="date" name="edate" min="<%=date%>"></td>
</tr>
<tr>
	<td>Max capacity : </td>
	<td><input type="number" name="maxcapacity" min="5" max="50"></td>
</tr>
<tr>
	<td> Mandatory : </td>
	<td><input type="radio" name="mandatory" value="true">True
	<input type="radio" name="mandatory" value="false">False</td>
</tr>
</table>
<input type="submit" value="Submit" style="background-color: #ADD8E6;
    border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;"></form>
</body>
</html>