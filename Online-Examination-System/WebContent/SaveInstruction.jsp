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
<title>Write Instructions</title>
</head>
<body>
<%
if(session.getAttribute("adminname")==null)
{
	response.sendRedirect("Login.jsp");
}
%>

<br>
<center><form action="/Online-Examination-System/SaveInstruction" method="post">         
<table>
<h2>Instruction:&nbsp;<input tye="text" name="num" placeholder="No." size="1"> </h2> &nbsp;&nbsp;<textarea name="instruction" rows="6" cols="100"  placeholder="Start Writing "></textarea>
   
<tr><td colspan="2"><input type="submit" value="Add Instruction"/> | <a href="AdminPanel.jsp"><button type="button">Home</button></a></td></tr>
</table>
</form></center>
<br>
 
 <center><jsp:include page="InstructionList.jsp"></jsp:include></center>

</body>
</html>