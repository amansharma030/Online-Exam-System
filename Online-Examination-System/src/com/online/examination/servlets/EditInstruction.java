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
 

@WebServlet("/EditInstruction")
public class EditInstruction extends HttpServlet {
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		PrintWriter out=response.getWriter();
		
		String sid=request.getParameter("num");
		int num=Integer.parseInt(sid);
		String instruction=request.getParameter("instruction");
		
		Instruction i=new Instruction();
		
		i.setInstruction(instruction);
		i.setNum(num);
		
		int status=InstructionDao.update(i);
		if(status>0){
			response.sendRedirect("SaveInstruction.jsp");
		}else{
			out.println("Please Fill Details Correctly!");
			 
		}
		
		out.close();
			
	}

}
