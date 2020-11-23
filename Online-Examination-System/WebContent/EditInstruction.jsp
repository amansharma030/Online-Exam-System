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
<title>Edit Instruction</title>
</head>
<body>

<%
	String sid=request.getParameter("num");
int num=Integer.parseInt(sid);

Instruction i=InstructionDao.getInstructionById(num);
%>

<br>
<center><h1>Edit Instruction<br>------------------------</h1>
<form action="/Online-Examination-System/EditInstruction" method="post">
        
<table>

<h2>Instruction:&nbsp;<input type="text" name="num" placeholder="NO." size="1" value="<%= i.getNum()%>" readonly/></h2>&nbsp;&nbsp; <textarea name="instruction" rows="6" cols="100" placeholder="Start Writing " ><%= i.getInstruction()%></textarea>

   
<tr><td colspan="2"><input type="submit" value="Edit"/>  | <a href="SaveInstruction.jsp"><button type="button">Back</button></a> | <a href="AdminPanel.jsp"><button type="button">Home</button></a></td></tr>

</table>
</form>
</center>


</body>
</html>