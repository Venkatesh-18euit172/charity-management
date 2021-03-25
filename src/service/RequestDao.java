package service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import model.Request;

public class RequestDao {

	private final static  String insertrequest = "insert into request(ngo_email,type_of_request,total_quantity,balance_quantity,measurements,expected_date,request_details,status) values (?,?,?,?,?,?,?,?)";
	private final static String getrequest="select * from request";
	private final static String get_individual_request="select * from request where ngo_email = ? ";
	private final static String successful_donations="select * from `request` where status='Accepted' and expected_date>? and ngo_email=?";
	private final static String delete_request="delete from request where id=?";
	private final static String update_date="update request set expected_date=? where id=?";
	public void storeRequest(ArrayList<Request> a)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(insertrequest);
			for(int i=0;i<a.size();i++)
			{
				pstmt.setString(1, a.get(i).getNgo_email());
				pstmt.setString(2,a.get(i).getType_of_request());
				pstmt.setInt(3, a.get(i).getTotal_quantity());
				pstmt.setInt(4, a.get(i).getTotal_quantity());
				pstmt.setString(5, a.get(i).getMeasurements());
				pstmt.setDate(6,a.get(i).getExpected_date());
				pstmt.setString(7, a.get(i).getRequest_details());
				pstmt.setString(8, a.get(i).getStatus());
				pstmt.executeUpdate();
			}
		}
		catch(Exception e)
		{
			System.out.println("storeRequest "+ e);
		}
	}
	
	public void updateRequest(Date date,int id)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(update_date);
			pstmt.setDate(1,date);
			pstmt.setInt(2,id);
		    pstmt.executeUpdate();

		}
		catch(Exception e)
		{
			System.out.println(e+"updateRequest");
		}
	}
	public ArrayList<Request> successfulDonations(String mailid)
	{
		ArrayList<Request> res=new ArrayList<Request>();
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(successful_donations);
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			pstmt.setDate(1,Date.valueOf(dtf.format(now)));
		    pstmt.setString(2,mailid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{ 
				int id=rs.getInt(1);
				String ngo_email=rs.getString(2);
				String type_of_request=rs.getString(3);
				int total_quantity=rs.getInt(4);
				int balance_quantity=rs.getInt(5);
				String measurements=rs.getString(6);
				Date expected_date=rs.getDate(7);
				String request_details=rs.getString(8);
				String status=rs.getString(9);
				
				Request obj=new Request(id, ngo_email, type_of_request, total_quantity,balance_quantity, measurements, expected_date, request_details, "waiting");
				res.add(obj);
			}
			
		}
		catch(Exception e)
		{
			System.out.println("successfulDonations "+e);
		}
		return res;
	}
	
	public void deleteRequest(int id)
	{
		
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(delete_request);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("deleteRequest"+ e);
		}
		
	}
	
	public ArrayList<Request> getRequest()
	{
		ArrayList<Request> res=new ArrayList<Request>();
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getrequest);
		//	pstmt.setString(1,mailid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				int id=rs.getInt(1);
				String ngo_email=rs.getString(2);
				String type_of_request=rs.getString(3);
				int total_quantity=rs.getInt(4);
				int balance_quantity=rs.getInt(5);
				String measurements=rs.getString(6);
				Date expected_date=rs.getDate(7);
				String request_details=rs.getString(8);
				String status=rs.getString(9);
				if(status.equalsIgnoreCase("waiting"))
				{
					Request obj=new Request(id, ngo_email, type_of_request, total_quantity,balance_quantity, measurements, expected_date, request_details, "waiting");
					res.add(obj);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("getRequest"+ e);
		}
		return res;
	}
	
	public ArrayList<Request> getIndividualRequest(String email)
	{
		ArrayList<Request> res=new ArrayList<Request>();
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(get_individual_request);
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				int id=rs.getInt(1);
				String ngo_email=rs.getString(2);
				String type_of_request=rs.getString(3);
				int total_quantity=rs.getInt(4);
				int balance_quantity=rs.getInt(5);
				String measurements=rs.getString(6);
				Date expected_date=rs.getDate(7);
				String request_details=rs.getString(8);
				String status=rs.getString(9);
				if(status.equalsIgnoreCase("waiting"))
				{
					Request obj=new Request(id, ngo_email, type_of_request, total_quantity,balance_quantity, measurements, expected_date, request_details, "waiting");
					res.add(obj);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("getRequest"+ e);
		}
		return res;
	}
	
	public ArrayList<Request> getNgoRequest(String mailid)
	{
		ArrayList<Request> res=new ArrayList<Request>();
		try
		{
			String query="Select * from request where ngo_email=?";
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,mailid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				int id=rs.getInt(1);
				String ngo_email=rs.getString(2);
				String type_of_request=rs.getString(3);
				int total_quantity=rs.getInt(4);
				int balance_quantity=rs.getInt(5);
				String measurements=rs.getString(6);
				Date expected_date=rs.getDate(7);
				String request_details=rs.getString(8);
				String status=rs.getString(9);
				if(status.equalsIgnoreCase("waiting"))
				{
					Request obj=new Request(id, ngo_email, type_of_request, total_quantity,balance_quantity, measurements, expected_date, request_details, "waiting");
					res.add(obj);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("getRequest"+ e);
		}
		return res;
	}
	
}