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
<title>Results</title>
</head>
<body>
<br>
<center>
<h1>Results<br>-----------</h1>
<%
	List<Result> list=ResultDao.getAllResults();
request.setAttribute("list",list);
%>
 
<table id="student" border="5" style="width:1200px">
<tr><th>Id</th><th>Name</th><th>Subject</th><th>Marks</th>  
<c:forEach items="${list}" var="u">
<tr><td>${u.getId()}</td><td>${u.getName()}</td><td>${u.getSubject()}</td><td>${u.getMarks()}</td></tr><br>
	
</c:forEach>
</table>
<br>
<a href="AdminPanel.jsp"><button type="button">Home</button></a>
</center>

</body>
</html>