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


@WebServlet("/SaveQuestion")
public class SaveQuestion extends HttpServlet {
	
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
   		
PrintWriter out=response.getWriter();
		
        String sid=request.getParameter("num");
		int num=Integer.parseInt(sid);
        String question=request.getParameter("question");
		String op1=request.getParameter("op1");
		String op2=request.getParameter("op2");
		String op3=request.getParameter("op3");
		String op4=request.getParameter("op4");
		String answer=request.getParameter("answer");
		String sname=request.getParameter("sname");
		
		request.setAttribute("sub", sname);
		
		
		Question m=new Question();
		m.setNum(num);
		m.setQuestion(question);
		m.setOp1(op1);
		m.setOp2(op2);
		m.setOp3(op3);
		m.setOp4(op4);
		m.setAnswer(answer);
		m.setSubject(sname);
		
		
		int status=QuestionDao.save(m);
		if(status>0){
			out.print("<p>Record saved successfully!</p>");
			request.getRequestDispatcher("SaveQuestion.jsp").include(request, response);
		}else{
			out.println("Please Fill Details Correctly!");
			
		}
		
		out.close();

	}

}
