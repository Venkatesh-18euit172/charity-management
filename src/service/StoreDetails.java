package service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Donor;
import model.Ngo;

public class StoreDetails {
   
	private static final String storengodetails="Insert into ngo values(?,?,?,?,?,?)";
	private static final String storedonordetails="Insert into donor values(?,?,?,?)";
	private static final String storeintologin="Insert into login values(?,?,?)";
	
	public void storeNgoDetails(Ngo obj)
	{   
		try
	   {
		Connection con=DBConnection.getConnection();
		PreparedStatement ps=con.prepareStatement(storengodetails);
		ps.setString(1, obj.getUser_email());
		ps.setString(2, obj.getName());
		ps.setString(3, obj.getAddress());
		ps.setString(4, obj.getMobile_Number());
		ps.setString(5, obj.getDocument_Link());
		ps.setString(6, obj.getStatus());
		ps.executeUpdate();
		
	   }
	   catch(Exception e)
	    {
		    System.out.println("StoreNgoDetails"+e);
	    }
		
		
	}
	
	public void storeDonorDetails(Donor obj)
	{   
		try
	   {
		Connection con=DBConnection.getConnection();
		PreparedStatement ps=con.prepareStatement(storedonordetails);
		ps.setString(1, obj.getUser_email());
		ps.setString(2, obj.getName());
		ps.setString(3, obj.getAddress());
		ps.setString(4, obj.getMobile_Number());
		
		ps.executeUpdate();
		
	   }
	   catch(Exception e)
	    {
		    System.out.println("StoreDonorDetails"+e);
	    }
		
		
	}
	
	public void login(String emailid,String password,String typeofuser)
	{   
		try
	   {
		Connection con=DBConnection.getConnection();
		PreparedStatement ps=con.prepareStatement(storeintologin);
		ps.setString(1, emailid);
		ps.setString(2, password);
		ps.setString(3, typeofuser);
		ps.executeUpdate();
		
	   }
	   catch(Exception e)
	    {
		    System.out.println("login"+e);
	    }
		
		
	}
	
}
