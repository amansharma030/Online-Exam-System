<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-image: url('img/Background2.jpg');
  background-repeat: no-repeat;
   background-attachment: fixed;
  background-size: 100% 100%;
  }
  
  
  
</style>
<meta charset="ISO-8859-1">
<title>Save Student</title>
</head>
<body>
<%
if(session.getAttribute("adminname")==null)
{
	response.sendRedirect("Login.jsp");
}
%>


<center>
<h1>Add New Student<br>---------------------------</h1>
<form action="/Online-Examination-System/SaveStudent" method="post">         
<table>
<tr><td>Name:</td><td><input type="text" name="name"/></td></tr>
<tr><td>Password:</td><td><input type="password" name="password"/></td></tr>
<tr><td>Email:</td><td><input type="email" name="email"/></td></tr>
<tr><td>Gender:</td><td><input type="radio" name="gender" value="male"/>Male <input type="radio" name="gender" value="female"/>Female </td></tr>
<tr><td>Phone No.:</td><td><input type="tel" name="phone"/></td></tr></td></tr>
<tr><td colspan="2"><br><center><input type="submit" value="Add Student"/> | <a href="AdminPanel.jsp"><button type="button">Home</button></a></center></td></tr>
</table>
</form>
 
<jsp:include page="StudentsList.jsp"></jsp:include>
</center> 

</body>
</html>