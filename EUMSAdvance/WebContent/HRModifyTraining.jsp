<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="hrtable.css" title="style" />
<title>Insert title here</title>
</head>
<body bgcolor="royalblue">
<%@ include file="HRMenu.jsp" %>
<% if(session.getAttribute("traininglist").equals(0)) {%>
<center><h1>No Trainings Scheduled!</h1></center>
<%}
else {%>
<center><h1>Modify Training</h1></center><br><br>
<script>
function valthisform()
{
    var checkboxs=document.getElementsByName("modify");
    var okay=false;
    for(var i=0,l=checkboxs.length;i<l;i++)
    {
        if(checkboxs[i].checked)
        {
            okay=true;
            break;
        }
    }
    if(!okay){
    alert("Please Select A Training First");
    return false;
    }
}
</script>
<form action="./HRModifyTrainingInputServlet" method="post">
<table id="table">
<tr>
	<th></th>
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
	<td><input type="radio" name="modify" value="${training.tid}"></td>
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
<center><input type="submit" value="Modify Training" onclick="return valthisform();" style="background-color: #151B54;
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
<%} %>	
</body>
</html>