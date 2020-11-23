package com.online.examination.dao;

import java.util.*;
import com.onilne.examination.entities.*;
import java.sql.*;

public class QuestionDao {

				public static Connection getConnection(){
				Connection con=null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system","root","root");
				}catch(Exception e){System.out.println(e);}
				return con;
			}
	
				public static int save(Question m){
					int status=0;
					try{
						Connection con=QuestionDao.getConnection();
						PreparedStatement ps=con.prepareStatement("insert into subject(Num,Question,Op1,Op2,Op3,Op4,Answer,Subject) values (?,?,?,?,?,?,?,?)");
						ps.setInt(1,m.getNum());
						ps.setString(2,m.getQuestion());
						ps.setString(3,m.getOp1());
						ps.setString(4,m.getOp2());
						ps.setString(5,m.getOp3());
						ps.setString(6,m.getOp4());
						ps.setString(7,m.getAnswer());
						ps.setString(8,m.getSubject());
						
						status=ps.executeUpdate();
						
						con.close();
					}catch(Exception ex){ex.printStackTrace();}
					
					return status;
				}
				
				public static List<Question> getAllQuestions(){
					List<Question> list=new ArrayList<Question>();
					
					try{
						Connection con=QuestionDao.getConnection();
						PreparedStatement ps=con.prepareStatement("select * from subject");
						ResultSet rs=ps.executeQuery();
						while(rs.next()){
							Question m=new Question();
							m.setNum(rs.getInt(1));
							m.setQuestion(rs.getString(2));
							m.setOp1(rs.getString(3));
							m.setOp2(rs.getString(4));
							m.setOp3(rs.getString(5));
							m.setOp4(rs.getString(6));
							m.setAnswer(rs.getString(7));
							m.setSubject(rs.getString(8));
							
							list.add(m);
						}
						con.close();
					}catch(Exception e){e.printStackTrace();}
					
					return list;
				}
				
				public static int update(Question m){
					int status=0;
					try{
						Connection con=QuestionDao.getConnection();
						PreparedStatement ps=con.prepareStatement("update subject set Question=?,Op1=?,Op2=?,Op3=?,Op4=?,Answer=?  where Num=?");
						ps.setString(1,m.getQuestion());
						ps.setString(2,m.getOp1());
						ps.setString(3,m.getOp2());
						ps.setString(4,m.getOp3());
						ps.setString(5,m.getOp4());
						ps.setString(6,m.getAnswer());
						ps.setInt(7,m.getNum());
						
						status=ps.executeUpdate();
						
						con.close();
					}catch(Exception ex){ex.printStackTrace();}
					
					return status;
				}
				
				public static int delete(Question m){                  
					int status=0;
					try{
						Connection con=QuestionDao.getConnection();
						PreparedStatement ps=con.prepareStatement("delete from subject where Num=?");
						ps.setInt(1,m.getNum());
						status=ps.executeUpdate();
						
						con.close();
					}catch(Exception e){e.printStackTrace();}
					
					return status;
				}
				
				public static Question getQuestionById(int num){
					Question m=new Question();
					
					try{
						Connection con=QuestionDao.getConnection();
						PreparedStatement ps=con.prepareStatement("select * from subject where Num=?");
						ps.setInt(1,num);
						ResultSet rs=ps.executeQuery();
						if(rs.next()){
							m.setNum(rs.getInt(1));
							m.setQuestion(rs.getString(2));
							m.setOp1(rs.getString(3));
							m.setOp2(rs.getString(4));
							m.setOp3(rs.getString(5));
							m.setOp4(rs.getString(6));
							m.setAnswer(rs.getString(7));
							
						}
						con.close();
					}catch(Exception ex){ex.printStackTrace();}
					
					return m;
				}
				
				public static Question getSubjectName(){
					Question m=new Question();
					 
					try{
						Connection con=QuestionDao.getConnection();
						PreparedStatement ps=con.prepareStatement("select Subject from subject where Num=1");
						ResultSet rs=ps.executeQuery();
						rs.next();							
							m.setSubject(rs.getString(1));
							 
						 
						con.close();
					}catch(Exception e){e.printStackTrace();}
					
					return m;
				}
					
				
				
	}
	

