package com.online.examination.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		HttpSession session= request.getSession();
		session.removeAttribute("studentname");
		session.removeAttribute("adminname");
		session.invalidate();
		response.sendRedirect("Login.jsp");
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		HttpSession session= request.getSession();
		session.removeAttribute("studentname");
		session.removeAttribute("adminname");
		session.invalidate();
		response.sendRedirect("Login.jsp");
	}

}
