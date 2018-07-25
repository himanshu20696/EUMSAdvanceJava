<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EUMS Portal</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
<div id="topdiv">
        <div id="error" style="text-align: center;position: absolute;bottom:0px;left:0;width:100%;background: yellow; color:midnightblue"></div></div>
        <div id="maindiv">
            <div id="leftdiv">
                <img src="images/back.png" id="backbl" style="cursor: pointer">
                <img src="images/employee.png" id="user" style="cursor: pointer">
                <p id="usr">Employee</p>
               <form action="./EmployeeLoginServlet" method="post" name="auth" id="fmleft">
                <input type="text" name="username" placeholder="Username" style="height: 25px;  border-color: black" /><br>
                <input type="password" name="password" placeholder="Password" style="height: 25px;  border-color: black" />
                <p id="sbutton"><input type="submit" value="Login" align="middle" style="background-color: black; color: white; border-color: black; width: 175px; height: 30px; font-size: 16px; cursor:pointer"></p>
                </form>
            </div>
            <div id="rightdiv">
                <img src="images/back.png" id="backbr" style="cursor: pointer">
                <img src="images/hr.png" id="admin" style="cursor: pointer">
                <p id="adm">HR</p>
                <form action="./HRLoginServlet" method="post" name="auth" id="fmright">                   
                <input type="text" name="username" placeholder="Username" style="height: 25px;  border-color: black"><br>
                <input type="password" name="password" placeholder="Password" style="height: 25px;  border-color: black">
                <p id="sbutton"><input type="submit" value="Login" align="middle" style="background-color: black; color: white; border-color: black; width: 175px; height: 30px; font-size: 16px; cursor: pointer"></p>
                </form>
            </div>
        </div>
        <% String result = (String)request.getAttribute("result");
        	if(result!=null)
        	{ %>
        		<script type="text/javascript">

                document.getElementById('error').innerHTML = '<%= result %>';

            </script>
        	<% 		
        	}%>
        <script src="login.js">
</script>
</body>
</html>