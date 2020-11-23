package com.online.examination.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.onilne.examination.entities.*;
import com.online.examination.dao.*;
 
 
@WebServlet("/EditStudent")
public class EditStudent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 
		 
			PrintWriter out=response.getWriter();
			
			String sid=request.getParameter("id");
			int id=Integer.parseInt(sid);
     		String name=request.getParameter("name");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			String gender=request.getParameter("gender");
			String phone=request.getParameter("phone");
			
			Student s=new Student();
			
			s.setName(name);
			s.setPassword(password);
			s.setEmail(email);
			s.setGender(gender);
			s.setPhone(phone);
			s.setId(id);
			
			
			int status=StudentDao.update(s);
			if(status>0){
				response.sendRedirect("SaveStudent.jsp");
			}else{
				out.println("Please Fill Details Correctly!");
				 
			}
			out.close();
		
		
	}

}
