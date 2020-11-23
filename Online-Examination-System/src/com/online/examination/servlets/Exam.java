package com.online.examination.servlets;

import java.io.*;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onilne.examination.entities.*;
import com.online.examination.dao.*;
 

@WebServlet("/Result")
public class Exam extends HttpServlet {
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		
		PrintWriter out=response.getWriter();
		String[] dbans = new String[100];
		List<Question> allQuestions = QuestionDao.getAllQuestions();
		int i = 1;
		int size = allQuestions.size();
		for(Question e : allQuestions)
		{   
			dbans[i] = e.getAnswer();
			
			i++;
			  
		}
		String[] userans = new String[100];
		for(int j = 1 ; j <= size ; j++)
		{
			
			userans[j] = request.getParameter(Integer.toString(j));
			 
		}
		
		
		int correctanswer=0;
		int unattempted = 0;
		int wronganswer=0;
		for(int k = 1 ; k<= size;k++)
		{
			if(userans[k].equalsIgnoreCase(dbans[k]))
			{
				correctanswer++;
			}
			else if(userans[k].equals("E"))
			{
				unattempted++;
			}
			else
			{
				wronganswer++;
			}
		}
		int attemped = size - unattempted;
		int marks=correctanswer-wronganswer;
		
		request.setAttribute("sz", size);
		request.setAttribute("at", attemped);
		request.setAttribute("ua", unattempted);
		request.setAttribute("ca", correctanswer);
		request.setAttribute("mks", marks);
		request.setAttribute("wa", wronganswer);
		RequestDispatcher rd=request.getRequestDispatcher("Result.jsp");
		rd.forward(request, response);
		
		 
 
	
	}

}
