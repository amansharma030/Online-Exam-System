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
<title>Prepare Questions</title>
</head>
<body>
<%
if(session.getAttribute("adminname")==null)
{
	response.sendRedirect("Login.jsp");
}
%>


<center>
<form action="/Online-Examination-System/SaveQuestion" method="post">         
<table>
<h2>Subject Name:&nbsp;<input type="text" name="sname" ></h2> 
 
<h2>Question:&nbsp;<input tye="text" name="num" placeholder="No." size="1"> </h2> &nbsp;&nbsp; <textarea name="question" rows="6" cols="100"  placeholder="Start Writing "></textarea>

   
<tr><td><b>Options:</b></td><td>
<tr><td><input type="radio" name="answer" value="A"/><textarea name="op1" rows="1"  placeholder=" Option 1 "></textarea> 
<tr><td><input type="radio" name="answer" value="B"/><textarea name="op2" rows="1"  placeholder=" Option 2 "></textarea> </td></tr></td></tr>
<tr><td><input type="radio" name="answer" value="C"/><textarea name="op3" rows="1"  placeholder=" Option 3 "></textarea> </td></tr></td></tr>
<tr><td><input type="radio" name="answer" value="D"/><textarea name="op4" rows="1"  placeholder=" Option 4 "></textarea> </td></tr></td></tr>


<tr><td><input type="submit" value="Add Question"/> | <a href="AdminPanel.jsp"><button type="button">Home</button></a></td></tr>
</table>
</form>
 
 <jsp:include page="QuestionList.jsp"></jsp:include>
 </center> 
 
</body>
</html>