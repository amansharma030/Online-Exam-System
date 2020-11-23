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
</style>
<meta charset="ISO-8859-1">
<title>Edit Mathematics</title>
</head>
<body>


<%
	String sid=request.getParameter("num");
int num=Integer.parseInt(sid);

Question m=QuestionDao.getQuestionById(num);
%>

<br>
<center><h1>Edit Questions<br>---------------------</h1>
<form action="/Online-Examination-System/EditQuestion" method="post">
        
<table>

<h2>Question:&nbsp;<input type="text" name="num" placeholder="No." size="1" value="<%= m.getNum()%>" readonly/></h2>&nbsp;&nbsp; <textarea name="question" rows="6" cols="100" placeholder="Start Writing " ><%= m.getQuestion()%></textarea>

   
<tr><td><b>Options:</b></td><td>
<tr><td><input type="radio" name="answer" value="A"  /><textarea name="op1" rows="1"  placeholder=" Option 1 " ><%= m.getOp1()%></textarea> 
<tr><td><input type="radio" name="answer" value="B" /><textarea name="op2" rows="1"  placeholder=" Option 2 " ><%= m.getOp2()%></textarea> </td></tr></td></tr>
<tr><td><input type="radio" name="answer" value="C" /><textarea name="op3" rows="1"  placeholder=" Option 3 " ><%= m.getOp3()%></textarea> </td></tr></td></tr>
<tr><td><input type="radio" name="answer" value="D" /><textarea name="op4" rows="1"  placeholder=" Option 4 " ><%= m.getOp4()%></textarea> </td></tr></td></tr>

<tr><td colspan="2"><input type="submit" value="Edit"/> | <a href="SaveQuestion.jsp"><button type="button">Back</button></a>  | <a href="AdminPanel.jsp"><button type="button">Home</button></a></td></tr>
</table>
</form>
<center>

</body>
</html>