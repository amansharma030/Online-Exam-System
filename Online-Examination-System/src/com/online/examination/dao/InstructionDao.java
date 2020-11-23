package com.online.examination.dao;
import java.util.*;

import com.onilne.examination.entities.*;

import java.sql.*;

public class InstructionDao {

	
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examination_system","root","root");
		}catch(Exception e){System.out.println(e);}
		return con;
	}

		public static int save(Instruction i){
			int status=0;
			try{
				Connection con=InstructionDao.getConnection();
				PreparedStatement ps=con.prepareStatement("insert into instructionset(Num,Instruction) values (?,?)");
				ps.setInt(1,i.getNum());
				ps.setString(2,i.getInstruction());
				
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception ex){ex.printStackTrace();}
			
			return status;
		}
		
		public static List<Instruction> getAllInstructions(){
			List<Instruction> list=new ArrayList<Instruction>();
			
			try{
				Connection con=InstructionDao.getConnection();
				PreparedStatement ps=con.prepareStatement("select * from instructionset");
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					Instruction i=new Instruction();
					i.setNum(rs.getInt(1)); 
					i.setInstruction(rs.getString(2));
					list.add(i);
				}
				con.close();
			}catch(Exception e){e.printStackTrace();}
			
			return list;
		}
		
		public static int update(Instruction i){
			int status=0;
			try{
				Connection con=InstructionDao.getConnection();
				PreparedStatement ps=con.prepareStatement("update instructionset set Instruction=?  where Num=?");
				ps.setString(1,i.getInstruction());
				 
				ps.setInt(2,i.getNum());
				
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception ex){ex.printStackTrace();}
			
			return status;
		}
		
		public static int delete(Instruction i){                  
			int status=0;
			try{
				Connection con=InstructionDao.getConnection();
				PreparedStatement ps=con.prepareStatement("delete from instructionset where Num=?");
				ps.setInt(1,i.getNum());
				status=ps.executeUpdate();
				
				con.close();
			}catch(Exception e){e.printStackTrace();}
			
			return status;
		}
		
		public static Instruction getInstructionById(int num){
			Instruction i=new Instruction();
			
			try{
				Connection con=InstructionDao.getConnection();
				PreparedStatement ps=con.prepareStatement("select * from instructionset where Num=?");
				ps.setInt(1,num);
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					i.setNum(rs.getInt(1));
					i.setInstruction(rs.getString(2));
					
				}
				con.close();
			}catch(Exception ex){ex.printStackTrace();}
			
			return i;
		}
		 		 
}
