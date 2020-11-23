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
<meta charset="ISO-8859-1">
<title>Start Exam</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

      <script>
     
      <%
       
    	String  clock = "180";
      %>
      var timeout = <%=clock %>
      function timer()
      {
    	  if( timeout > 0)
    		  {
    		  timeout--;
    		  document.forma.clock.value ="Time Out";
    	      document.forma.clock.value = timeout;
    		  window.setTimeout("timer()", 1000 );
    		  }
    	  else
    		  {
    		  document.forma.clock.value ="Time Out";
    		  formb.submit();
    		  }
      }
      </script>
     <style>
     
     div.sticky {
  position: -webkit-sticky; /* Safari */
  position: sticky;
  top: 0;
   
}
     
div.relative {
  position: relative;
  left: 30px;
   
}
</style>  

 
</head>


<body onload="timer()"> 

<div class="sticky">
 <center>
  <form name="forma" action="<%=request.getRequestURL()%>">

     <font color="green">Time Left <input size="1" name="clock" id="fno" value="<%=clock%>" style="background: #ffcdd2" readonly></font>
   </form>
 </center>
</div>
<%
if(session.getAttribute("studentname")==null)
{
	response.sendRedirect("Login.jsp");
}
%>

  <!-- Question Starts -->
  
  <%
	List<Question> qlist=QuestionDao.getAllQuestions();
request.setAttribute("list",qlist);
%>

  
<div class="relative">

<form  name="formb" action="/Online-Examination-System/Result" method="post">         
  
  <c:forEach items="${list}" var="v">
	<tr><br><td>${v.getNum()}. </td><td>${v.getQuestion()}</td><br><br>
	<td><td><input type="radio"  name="${v.getNum()}" value="A"/></td>${v.getOp1()}</td><br>
	<td><td><input type="radio"  name="${v.getNum()}" value="B"/></td>${v.getOp2()}</td><br>
	<td><td><input type="radio"  name="${v.getNum()}" value="C"/></td>${v.getOp3()}</td><br>
	<td><td><input type="radio"  name="${v.getNum()}" value="D"/></td>${v.getOp4()}</td><br></tr>
	 
	<input type="hidden" value="E" name="${v.getNum()}" checked="checked" >
	
	
</c:forEach>

<tr><td colspan="2"><center><br><input type="submit" value="Submit"/></center></td></tr>
 
 

</table>
 
</div>
      
</body>
</html>