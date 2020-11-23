package com.online.examination.dao;

import java.util.*;
import com.onilne.examination.entities.*;
import java.sql.*;

 
import com.onilne.examination.entities.Question;

public class ResultDao {


	public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system","root","root");
	}catch(Exception e){System.out.println(e);}
	return con;
}

	
	public static void save(Result r){
		
		try{
			Connection con=ResultDao.getConnection();
			PreparedStatement ps=con.prepareStatement("insert into result(Id,Name,Subject,Marks) values (?,?,?,?)");
			ps.setInt(1,r.getId());
			ps.setString(2,r.getName());
			ps.setString(3,r.getSubject());
			ps.setInt(4,r.getMarks());
			 
	
			ps.executeUpdate();
			
			con.close();
		}catch(Exception ex){ex.printStackTrace();}
		
		
	}
	
	
	public static List<Result> getAllResults(){
		List<Result> list=new ArrayList<Result>();
		
		try{
			Connection con=QuestionDao.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from result");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Result r=new Result();
				r.setId(rs.getInt(1));
				r.setName(rs.getString(2));
				r.setSubject(rs.getString(3));
				r.setMarks(rs.getInt(4));
				 
				list.add(r);
			}
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
		return list;
	}
		
}
