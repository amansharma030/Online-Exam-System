<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="com.online.examination.dao.*"%>
    <%@page import="com.onilne.examination.entities.*"%>
                    
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
  
  
#student {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#student td, #student th {
  border: 1px solid #ddd;
  padding: 8px;
  border: 1px solid black;
}

#student tr {background-color: #FFFFFF;}

#student tr:hover {background-color: #ddd;}

#student th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

 
  
</style>
<meta charset="ISO-8859-1">
<title>Edit Student</title>
</head>
<body>

<%
String sid=request.getParameter("id");
int id=Integer.parseInt(sid);

Student s=StudentDao.getStudentById(id);
%>
<br><br>
<center>
<h1>Edit Details<br>------------------</h1>

<form action="/Online-Examination-System/EditStudent" method="post">
<input type="hidden" name="id" value="<%=s.getId() %>"/>

<table id="student" border="5" style="width:1200px">

<tr><td>Name:</td><td><input type="text" name="name" value="<%= s.getName()%>"/></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" value="<%= s.getPassword()%>"/></td></tr>
<tr><td>Email:</td><td><input type="email" name="email" value="<%= s.getEmail()%>"/></td></tr>
<tr><td>Gender:</td><td><input type="radio" name="gender" value="male"/>Male <input type="radio" name="gender" value="female"/>Female </td></tr>
<tr><td>Phone No.:</td><td><input type="tel" name="phone" value="<%= s.getPhone()%>"/></td></tr></td></tr>
<tr><td colspan="2"><br><center><input type="submit" value="Edit"/> | <a href="SaveStudent.jsp"><button type="button">Back</button></a>  | <a href="AdminPanel.jsp"><button type="button">Home</button></a></center></td></tr>

</table>
</form>
</center>


</body>
</html>