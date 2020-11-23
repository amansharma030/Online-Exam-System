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


@WebServlet("/SaveInstruction")
public class SaveInstruction extends HttpServlet {
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
PrintWriter out=response.getWriter();
		
        String sid=request.getParameter("num");
        int num=Integer.parseInt(sid);
		String instruction=request.getParameter("instruction");
		
		
		Instruction i=new Instruction();
		i.setNum(num);
		i.setInstruction(instruction);
		 
		
		
		int status=InstructionDao.save(i);
		if(status>0){
			out.print("<p>Record saved successfully!</p>");
			request.getRequestDispatcher("SaveInstruction.jsp").include(request, response);
		}else{
			out.println("Please Fill Details Correctly!");
			
		}
		
		out.close();
		
	}

}
