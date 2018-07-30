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
</head>
<body bgcolor="midnightblue">
<%@include file="EmployeeMenu.jsp" %><br><br>
<center><h1>Upcoming Training</h1></center><br><br>
<script>
function valthisform()
{
    var checkboxs=document.getElementsByName("enroll");
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
<center><input type="submit" value="Enroll For Training" onclick="return valthisform();" style="background-color: #ADD8E6;
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
<div id="error" style="font-size: 18px;text-align: center;width:100%;background: yellow; color:midnightblue"></div>

<% 
HashMap<Integer, String> selectedTraining = new HashMap<>();
selectedTraining = (HashMap<Integer, String>)session.getAttribute("selectedTraining");
System.out.println(selectedTraining);
System.out.println("in scriplet");
if(selectedTraining != null)
	{
	System.out.println("in if block");
		Set<Integer> keys = selectedTraining.keySet();
	    for(Integer i:keys){
	    	System.out.println("in for");
			String res = selectedTraining.get(i);
			if(res.equals("requested")){
				%>
	        	<script type="text/javascript">
	        	document.getElementById('error').insertAdjacentHTML('beforeend', "Request For Training ID "+'<%= i %>'+" Has Been Send To HR. Please Wait For Comformation<br>");
				</script>
	        	<% 
		    }
		   else if(res.equals("rejected")){
				%>
	        	<script type="text/javascript">
	        	document.getElementById('error').insertAdjacentHTML('beforeend', "Your Request For Training ID "+'<%= i %>'+" Has Been Rejected As You Are Already Enrolled For A Training In That Period<br>");
				</script>
	            <%
		    }
		   else if(res.equals("alreadyrequested")){
				%>
	        	<script type="text/javascript">
	        	document.getElementById('error').insertAdjacentHTML('beforeend', "You Have Already Requested For Training ID "+'<%= i %>'+". Your Request Is Still Pending For HR Approval<br>");
				</script>
	            <%
		    }
	    }
	    session.removeAttribute("selectedTraining");
   }
%>

</body>
</html>