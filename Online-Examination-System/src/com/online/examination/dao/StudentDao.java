package com.online.examination.dao;

import java.util.*;
import com.onilne.examination.entities.Student;

import java.sql.*;

public class StudentDao {

		public static Connection getConnection(){
			Connection con=null;
			try{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system","root","root");
			}catch(Exception e){System.out.println(e);}
			return con;
		}
		
		
		public static boolean check(Student s){
			 
			try{
				Connection con=StudentDao.getConnection();
				PreparedStatement ps=con.prepareStatement("select * from student where phone=? and password=?");
				ps.setString(1,s.getPhone());
				ps.setString(2,s.getPassword());
				  
				ResultSet rs= ps.executeQuery();
				
				if(rs.next())
				{

					s.setName(rs.getString("name"));
					s.setId(rs.getInt("id"));
					return true;
				}
				
				
				}
				
				 
			catch(Exception e){
				e.printStackTrace();
				}
			return false;
			 
		}
	
		public static int save(Student s){
			int status=0;
			try{
				Connection con=StudentDao.getConnection();
				PreparedStatement ps=con.prepareStatement("insert into student(name,password,email,gender,phone) values (?,?,?,?,?)");
				ps.setString(1,s.getName());
				ps.setString(2,s.getPassword());
				ps.setString(3,s.getEmail());
				ps.setString(4,s.getGender());
				ps.setString(5,s.getPhone());
				
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception ex){ex.printStackTrace();}
			
			return status;
		}
		public static int update(Student s){
			int status=0;
			try{
				Connection con=StudentDao.getConnection();
				PreparedStatement ps=con.prepareStatement("update student set name=?,password=?,email=?,gender=?,phone=?  where id=?");
				ps.setString(1,s.getName());
				ps.setString(2,s.getPassword());
				ps.setString(3,s.getEmail());
				ps.setString(4,s.getGender());
				ps.setString(5,s.getPhone());
				ps.setInt(6,s.getId());
				
				
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception ex){ex.printStackTrace();}
			
			return status;
		}
		public static int delete(Student s){                  
			int status=0;
			try{
				Connection con=StudentDao.getConnection();
				PreparedStatement ps=con.prepareStatement("delete from student where id=?");
				ps.setInt(1,s.getId());
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception e){e.printStackTrace();}
			
			return status;
		}
		public static Student getStudentById(int id){
			Student s=new Student();
			
			try{
				Connection con=StudentDao.getConnection();
				PreparedStatement ps=con.prepareStatement("select * from student where id=?");
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					s.setId(rs.getInt(1));
					s.setName(rs.getString(2));
					s.setPassword(rs.getString(3));
					s.setEmail(rs.getString(4));
					s.setGender(rs.getString(5));
					s.setPhone(rs.getString(6));
				}
				con.close();
			}catch(Exception ex){ex.printStackTrace();}
			
			return s;
		}
		public static List<Student> getAllStudents(){
			List<Student> list=new ArrayList<Student>();
			
			try{
				Connection con=StudentDao.getConnection();
				PreparedStatement ps=con.prepareStatement("select * from student");
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					Student s=new Student();
					s.setId(rs.getInt(1));
					s.setName(rs.getString(2));
					s.setPassword(rs.getString(3));
					s.setEmail(rs.getString(4));
					s.setGender(rs.getString(5));
					s.setPhone(rs.getString(6));
					list.add(s);
				}
				con.close();
			}catch(Exception e){e.printStackTrace();}
			
			return list;
		}
	}

	
