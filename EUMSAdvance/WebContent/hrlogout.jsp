<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="hrbutton.css" title="style" />
</head>
<body bgcolor="royalblue">
<%@include file="HRMenu.jsp" %><br><br><br><br><br><br><br><br><br><br><br><br>
<form action="./LogoutServlet" method="post">
<center><h1>Are You Sure You Want To Logout</h1></center>
<center><input type="submit" value="Yes" id="button"></center>
</form>
</body>
</html>