<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page import="com.online.examination.dao.*"%>
     <%@page import="com.onilne.examination.entities.*"%>
    <%@page import="java.util.List"%>
    
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
<title>Students List</title>
</head>
<body>

 		 
<h1>Students List</h1>

<%
List<Student> list=StudentDao.getAllStudents();
request.setAttribute("list",list);
%>

<table id="student" border="5" style="width:1200px">
<tr><th>Id</th><th>Name</th><th>Password</th><th>Email</th><th>Gender</th><th>Phone</th><th>Edit</th><th>Delete</th></tr>
<c:forEach items="${list}" var="u">
	<tr><td>${u.getId()}</td><td>${u.getName()}</td><td>${u.getPassword()}</td><td>${u.getEmail()}</td><td>${u.getGender()}</td><td>${u.getPhone()}</td><td><a href="EditStudent.jsp?id=${u.getId()}">Edit</a></td><td><a href="DeleteStudent.jsp?id=${u.getId()}">Delete</a></td></tr>
</c:forEach>
</table>


</body>
</html>