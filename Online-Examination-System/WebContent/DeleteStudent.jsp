<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.online.examination.dao.StudentDao"%>
    
    <jsp:useBean id="u" class="com.onilne.examination.entities.Student"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	StudentDao.delete(u);
response.sendRedirect("SaveStudent.jsp");
%>
</body>
</html>