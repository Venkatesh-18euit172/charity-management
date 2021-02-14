package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Ngo;

public class NgoDao {

	private static final String getNgo="select * from ngo where User_email = ? ";
	private static final String deleteNgo="Delete from ngo where User_email = ? ";
	private static final String deleteNgo_login="Delete from login where user_email = ? ";
	private static final String getAllNgo="select * from ngo";
	private static final String storeLogin="insert into login values (?,?,?) ";
	
	public Ngo getNgo(String email)
	{
		Ngo obj=null;
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getNgo);
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String User_email=rs.getString(1);
			String Name=rs.getString(2);
			String Address=rs.getString(3);
			String Mobile_Number=rs.getString(4);
			String Document_Link=rs.getString(5);
			String Status=rs.getString(6);
			obj=new Ngo(User_email, Name, Address, Mobile_Number, Document_Link,Status);
		}
		catch(Exception e)
		{
			System.out.println("getNgo "+e);
		}
		return obj;
	}
	
	public ArrayList<Ngo> getAllNgo()
	{
		ArrayList<Ngo> result=new ArrayList<Ngo>();
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getAllNgo);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				String User_email=rs.getString(1);
				String Name=rs.getString(2);
				String Address=rs.getString(3);
				String Mobile_Number=rs.getString(4);
				String Document_Link=rs.getString(5);
				String Status=rs.getString(6);
				Ngo obj=new Ngo(User_email, Name, Address, Mobile_Number, Document_Link,Status);
				result.add(obj);
			}
		}
		catch(Exception e)
		{
			System.out.println("getAllNgo "+e);
		}
		return result;
	}
	
	public void delete(String email)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(deleteNgo);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			pstmt=con.prepareStatement(deleteNgo_login);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("delete "+e);
		}
	}
	
	public void storeLogin(String email)
	{
		try
		{
			String getPassword="select Status from ngo where User_email = ? ";
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getPassword);
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String password=rs.getString(1);
			String updateStatus="Update ngo set Status = 'Accepted' where User_email = ? ";
			pstmt=con.prepareStatement(updateStatus);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			pstmt=con.prepareStatement(storeLogin);
			pstmt.setString(1,email);
			pstmt.setString(2, password);
			pstmt.setString(3, "ngo");
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("storeLogin "+e);
		}
	}
	
	public ArrayList<ArrayList<String>> donationList(int id)
	{
		ArrayList<ArrayList<String>> res=new ArrayList<ArrayList<String>>();
		try
		{
			String getdonation="select donor_email , donated_quantity , measurements , donated_date from donation where donation_id = ? ";
			String getDonor="select Name , Address , Mobile_Number from donor where User_email = ?";
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getdonation);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				ArrayList<String> obj=new ArrayList<String>();
				obj.add(rs.getString(1));
				obj.add(String.valueOf(rs.getInt(2))+" "+rs.getString(3));
				String date[]=String.valueOf(rs.getDate(4)).split("-");
				String yyyy=date[0];String mm=date[1];String dd=date[2];
				obj.add(dd+"-"+mm+"-"+yyyy);
				PreparedStatement ps=con.prepareStatement(getDonor);
				ps.setString(1, rs.getString(1) );
				ResultSet rs1=ps.executeQuery();
				rs1.next();
				obj.add(rs1.getString(1));
				obj.add(rs1.getString(2));
				obj.add(rs1.getString(3));
				res.add(obj);
			}
		}
		catch(Exception e)
		{
			System.out.println("donationList "+e);
		}
		return res;
	}
	
	public ArrayList<String> requestDetails(int id)
	{
		ArrayList<String> res=new ArrayList<String>();
		String getRequest="select type_of_request , total_quantity , balance_quantity , measurements , expected_date , request_details from request where id = ? and status = ? ";
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getRequest);
			pstmt.setInt(1, id);
			pstmt.setString(2,"waiting");
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			res.add(rs.getString(1));
			res.add(String.valueOf(rs.getInt(2))+" "+rs.getString(4));
			res.add(String.valueOf(rs.getInt(3))+" "+rs.getString(4));
			String date[]=String.valueOf(rs.getDate(5)).split("-");
			String yyyy=date[0];String mm=date[1];String dd=date[2];
			res.add(dd+"-"+mm+"-"+yyyy);
			res.add(rs.getString(6));
		}
		catch(Exception e)
		{
			System.out.println("requestDetails "+e);
		}
		return res;
	}
}
