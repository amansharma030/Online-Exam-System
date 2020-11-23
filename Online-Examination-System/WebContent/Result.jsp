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
<title>Result</title>
</head>
<body>
<%
if(session.getAttribute("studentname")==null)
{
	response.sendRedirect("Login.jsp");
}
%>

<%
 
int id=(int)session.getAttribute("studentid");
String name =(String)session.getAttribute("studentname");


int attemped=(int)request.getAttribute("at");
int unattempted=(int)request.getAttribute("ua");
int correctanswer=(int)request.getAttribute("ca");
int marks=(int)request.getAttribute("mks");
int size=(int)request.getAttribute("sz");
int wronganswer=(int)request.getAttribute("wa");
 
%>

<%
	Question m=QuestionDao.getSubjectName();


%>
 
 <%

Result r=new Result();
r.setId(id);
r.setName(name);
r.setSubject(m.getSubject());
r.setMarks(marks);

ResultDao.save(r);
%>

 
<div  height="300" width=100% style="background-color: yellow"><pre><h1><center><font color="#32CD32">Results</font></center></h1></pre></div>

 
       <h2>Id: <%=session.getAttribute("studentid") %> || Name: <%=session.getAttribute("studentname") %> </h2> 
     
 
<table id="student" border="5" style="width:1200px">
   
  <tr>
    
    <td>1</td>
    <td>Total no. of Questions</td>
    <td><%=size %></td>
   </tr>
  <tr>
    <td>2</td>
    <td>Number Of Questions Attempted</td>
    <td><%=attemped %></td>
  </tr>
  <tr>
    <td>3</td>
    <td>Number of Correct Answers</td>
    <td><font color="#32CD32"><%=correctanswer %></font></td>
  </tr>
  <tr>
    <td>4</td>
    <td>Number of Wrong Answers</td>
    <td><font color="red"><%=wronganswer %></font></td>
  </tr>
  <tr>
    <td>5</td>
    <td>Total Marks</td>
    <td><h3><font color="blue"><%=marks %></font></h3></td>
  </tr>
</table>
<br>

 


<center>
<a href="/Online-Examination-System/Logout" method="post">
<img src="img/Logout.png" >
</a>
</center>
</body>
</html>