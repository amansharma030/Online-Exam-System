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
<title>Student Panel</title>
</head>
<body>

<%
if(session.getAttribute("studentname")==null)
{
	response.sendRedirect("Login.jsp");
}
%>

<%
String name=(String)session.getAttribute("studentname");
%> 
<center>
<h1> <font  color ="green">Welcome   <%out.println(name); %></font></h1>

<br>
<%
	Question m=QuestionDao.getSubjectName();

%>
 
<h2>Subject - <%=m.getSubject() %><br>--------------------------</h2> 

<h2>Read Instructions Carefully</h2>

<%
	List<Instruction> list=InstructionDao.getAllInstructions();
request.setAttribute("list",list);
%>
 
<table id="student" border="5" style="width:1200px">
<tr><th>Number</th><th>Instruction</th> 
<c:forEach items="${list}" var="u">
<tr><td>${u.getNum()}</td><td>${u.getInstruction()}</td></tr><br>
	
</c:forEach>
</table>

<br>

<a href="Exam.jsp">
<img src="img/Start%20Exam.png"  >
</a>
&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;

<a href="/Online-Examination-System/Logout" method="post">
<img src="img/Logout.png"  >
</a>
 
</center>
</body>
</html>