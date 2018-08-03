<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Training Modified</title>
</head>
<body bgcolor="royalblue">
<%@ include file="HRMenu.jsp" %><br><br>
<%if(session.getAttribute("modified").equals(true)) {%>
<center><h1>Training Modified Successfully !</h1><br><br></center>
<%}
else{%>
<center><h1>Training Modification Failed !</h1><br><br></center>
<%} %>
</body>
</html>