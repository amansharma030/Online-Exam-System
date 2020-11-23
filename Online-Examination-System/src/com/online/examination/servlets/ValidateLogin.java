package com.online.examination.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.onilne.examination.entities.*;
import com.online.examination.dao.*;

 
@WebServlet("/ValidateLogin")
public class ValidateLogin extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String phone = request.getParameter("phone");
		    String password = request.getParameter("password");
		   
		    
		    
		   Student s= new Student();
		   s.setPhone(phone);
			s.setPassword(password);
		 
	 try {
		if(StudentDao.check(s))
		 {
			HttpSession session = request.getSession();
			session.setAttribute("studentname",s.getName());
			session.setAttribute("studentid",s.getId() );
			response.sendRedirect("StudentPanel.jsp");
		 
		 }
	 else if(phone.equals("9999999999") && password.equals("admin"))
		{
			HttpSession session = request.getSession();
			session.setAttribute("adminname","Admin");
			 response.sendRedirect("AdminPanel.jsp");
		}
		 else {
			 
			 response.sendRedirect("Login.jsp");
		 }
	} catch (IOException e) {
		 
		e.printStackTrace();
	}
			 
	}

}
