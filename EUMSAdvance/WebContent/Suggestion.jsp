<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="midnightblue">
<%@include file="EmployeeMenu.jsp" %>
<div style="text-align: center">
       <br><br><br><br>
        <h1>Write Suggestion Here</h1>
        <br>
        <form action="mailto:admin@eums.com" method="post" enctype="text/plain">
          <div class="form_settings" style="color: white;">
            <p>Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  type="text" name="name" /></p><br>
            <p>Email Address&nbsp;&nbsp;&nbsp;&nbsp;<input  type="email" name="emailId"  /></p><br>
            <p>Message&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea  rows="8" cols="50" name="your_enquiry"></textarea></p>
            <br>
            <br>
            <p style="padding-top: 15px;margin-left:-7%;"><input class="submit" type="submit" name="contact_submitted" value="Submit" /></p>
          </div>
        </form>

      </div>
</body>
</html>