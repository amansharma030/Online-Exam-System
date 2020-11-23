<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>

fieldset {
  background-color: #eeeeee;
   margin-left: 50px;
  margin-right: 5px;
}

legend {
  background-color: gray;
  color: white;
  padding: 5px 50px;
   
}

input {
  margin: 5px;
}

form { 
margin-left: 400px;
  margin-right: 100px;
margin-top: 200px;
width : 30%;
}

body {
  background-image: url('img/Login.png');
  background-repeat: no-repeat;
   background-attachment: fixed;
  background-size: 100% 100%;
  }
  
</style>
<meta charset="ISO-8859-1">
<title>Login Here</title>

</head>

<body>

<center>

   <form action="/Online-Examination-System/ValidateLogin" method="post">
  <fieldset>
  <legend>LOGIN:</legend>
   Phone No.:  <input type="text" name="phone"><br><br>
  Password :  <input type="password" name="password"><br><br>
 <input type="submit" value="Submit"> </center> 
  
</fieldset>
</form>
 


</body>
</html>