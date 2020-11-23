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
#instruction {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#instruction td, #instruction th {
  border: 1px solid #ddd;
  padding: 8px;
  border: 1px solid black;
}

#instruction tr {background-color: #FFFFFF;}

#instruction tr:hover {background-color: #ddd;}

#instruction th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

</style>

<title>Instructions List</title>
</head>

<body>

<h1>Instructions List<br>------------------------</h1>


<%
	List<Instruction> list=InstructionDao.getAllInstructions();
request.setAttribute("list",list);
%>

<table id="instruction" border="5" style="width:1200px">
<tr><th>Number</th><th>Instruction</th><th>Edit</th><th>Delete</th>
<c:forEach items="${list}" var="u">
	<tr><td>${u.getNum()}</td><td>${u.getInstruction()}</td><td><a href="EditInstruction.jsp?num=${u.getNum()}">Edit</a></td><td><a href="DeleteInstruction.jsp?num=${u.getNum()}">Delete</a></td></tr>
	
</c:forEach>
</table>                                                           
</body>
</html>