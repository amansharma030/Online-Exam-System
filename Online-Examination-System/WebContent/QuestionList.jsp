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
<meta charset="ISO-8859-1">
<title>Questions List</title>
</head>
<body>

 		 <%
	Question m=QuestionDao.getSubjectName();

request.setAttribute("Subject",m.getSubject());
%>

<center><h1>Subject - ${Subject}<br>---------------------------------</h1></center>

 		 
<h2>Questions List</h2>

<%
	List<Question> list=QuestionDao.getAllQuestions();
request.setAttribute("list",list);
%>
 
 
<table id="instruction" border="5" style="width:1200px">
<tr><th>Number</th><th>Questions</th><th>Option 1</th><th>Option 2</th><th>Option 3</th><th>Option 4</th><th>Answer</th><th>Edit</th><th>Delete</th>
<c:forEach items="${list}" var="u">
	<tr><td>${u.getNum()}</td><td>${u.getQuestion()}</td><td>${u.getOp1()}</td><td>${u.getOp2()}</td><td>${u.getOp3()}</td><td>${u.getOp4()}</td><td>${u.getAnswer()}</td><td><a href="EditQuestion.jsp?num=${u.getNum()}">Edit</a></td><td><a href="DeleteQuestion.jsp?num=${u.getNum()}">Delete</a></td></tr>
	
</c:forEach>
</table>

</body>
</html>