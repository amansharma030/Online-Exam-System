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
<title>Admin Panel</title>
  
</head>
<body>
  
<%
if(session.getAttribute("adminname")==null)
{
	response.sendRedirect("Login.jsp");
}
%>  
  
<%
String name=(String)session.getAttribute("adminname");
%> 
<br><br> 
 <center><h1> <font  color ="#4CAF50">Welcome   <%out.println(name); %><br>-----------------------</font></h1> 

<br><br><br>
 
<a href="SaveStudent.jsp">
<img src="img/Add%20Update%20Student.png"  >
</a>
 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;

<a href="SaveInstruction.jsp">
<img src="img/Add%20Update%20Instruction.png"  >
</a>
 <br><br><br><br><br><br>
<a href="SaveQuestion.jsp">
<img src="img/Prepare%20Exam.png"  >
</a>
 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
 
<a href="ResultList.jsp">
<img src="img/Results.png"  >
</a> 
<br><br><br><br>
<a href="/Online-Examination-System/Logout" method="post">
<img src="img/Logout.png"  >
</a>
</center>
</body>
</html>