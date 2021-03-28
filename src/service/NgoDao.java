package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Ngo;

public class NgoDao {

	private static final String getNgo="select * from ngo where User_email = ? ";
	private static final String deleteNgo="Delete from ngo where User_email = ? ";
	private static final String getAcceptedNgo="select * from ngo where status='Accepted'";
	private static final String getAllNgo="select * from ngo where status!='Accepted'";
	private static final String storeLogin="insert into login values (?,?,?) ";
	private static final String checklogin="select type_of_user from login where user_email=? and password=?";
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
	
	public ArrayList<Ngo> getAcceptedNgo()
	{
		ArrayList<Ngo> result=new ArrayList<Ngo>();
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getAcceptedNgo);
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
			System.out.println("getAcceptedNgo "+e);
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
	
	
	public ArrayList<String> requestDescription(int id)
	{
		ArrayList<String> res=new ArrayList<String>();
		String getRequest="select type_of_request , total_quantity , balance_quantity , measurements , expected_date , request_details from request where id = ? and status = ? ";
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getRequest);
			pstmt.setInt(1, id);
			pstmt.setString(2,"Accepted");
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
			System.out.println("requestDescription "+e);
		}
		return res;
	}
	public boolean checkLogin(String mailid,String password,String user)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(checklogin);
			pstmt.setString(1, mailid);
			pstmt.setString(2, password);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString("type_of_user").equals(user))
					return true;
			}
			return false;
				
			
		}
		catch(Exception e)
		{
			System.out.println("checkLogin"+e);
		}
		return false;
	}
  
	public ArrayList<ArrayList<String>> ngoHistory(String mailid)
	{
		ArrayList<ArrayList<String>> ans=new ArrayList<ArrayList<String>>();	
		try
		{
			Connection con=DBConnection.getConnection();
			String query1="SELECT id,type_of_request,total_quantity,measurements FROM `request` WHERE ngo_email=?";
			
			PreparedStatement pstmt=con.prepareStatement(query1);
			pstmt.setString(1, mailid);
			System.out.println("1");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				ArrayList<String> temp=new ArrayList<String>();
				
				String query2="SELECT donor_email,donated_quantity FROM `donation` WHERE donation_id=?";
				pstmt=con.prepareStatement(query2);
				
				pstmt.setInt(1,rs.getInt("id"));
				System.out.println("2");
				ResultSet rs1=pstmt.executeQuery();
				
				while(rs1.next())
				{   
					temp.add(rs.getString("type_of_request"));
					temp.add(rs.getInt("total_quantity")+" "+rs.getString("measurements"));
					temp.add(rs1.getInt("donated_quantity")+" "+rs.getString("measurements"));
					String query3="SELECT Name,Mobile_Number FROM `donor` WHERE User_email=?"; 
					pstmt=con.prepareStatement(query3);
					pstmt.setString(1,rs1.getString("donor_email"));
					System.out.println("3");
					ResultSet rs2=pstmt.executeQuery();
					if(rs2.next())
					{
						temp.add(rs2.getString("Name"));
						temp.add(rs1.getString("donor_email"));
						temp.add(rs2.getString("Mobile_Number"));
					}
					
				}
				for(String i:temp)
				{
					System.out.println(i);
				}
				System.out.println(temp.size());
				if(temp.size()==0)
					 continue;
				ans.add(temp);
			}
	    
		}
		catch(Exception e)
		{
			System.out.println("ngoHistory "+e);
		}
		return ans;
	}
   
	
	public ArrayList<ArrayList<String>> receivedDonation(String mailid)
	{
		ArrayList<ArrayList<String>> ans=new ArrayList<ArrayList<String>>();	
		try
		{
			Connection con=DBConnection.getConnection();
			String query1="SELECT donor_email,donation_id,donated_quantity,measurements,donated_date,id FROM `donation` WHERE ngo_email=? and status='waiting'";
			
			PreparedStatement pstmt=con.prepareStatement(query1);
			pstmt.setString(1, mailid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
	            
				ArrayList<String> temp=new ArrayList<String>();
				String query2="SELECT type_of_request,total_quantity FROM `request` WHERE id=?";
				pstmt=con.prepareStatement(query2);
				
				pstmt.setInt(1,rs.getInt("donation_id"));
		    	ResultSet rs1=pstmt.executeQuery();
				rs1.next();
		    	String query3="SELECT Name,Address,Mobile_Number FROM `donor` WHERE User_email=?";
		    	pstmt=con.prepareStatement(query3);
		    	pstmt.setString(1, rs.getString("donor_email"));
		    	ResultSet rs2=pstmt.executeQuery();
		    	rs2.next();
		    	temp.add(rs1.getString("type_of_request"));
		    	temp.add(rs1.getString("total_quantity")+" "+rs.getString("measurements"));
		    	temp.add(rs.getString("donated_quantity")+" "+rs.getString("measurements"));
		    	temp.add(rs.getString("donated_date"));
		    	temp.add(rs.getString("donor_email"));
		    	temp.add(rs2.getString("Name"));
		    	temp.add(rs2.getString("Mobile_Number"));
		    	temp.add(rs.getInt("id")+"");
				ans.add(temp);
			}
	    
		}
		catch(Exception e)
		{
			System.out.println("receivedDonation "+e);
		}
		return ans;
	}
    
	
	public void acceptedDonation(int id,int donatedquantity)
	{
		try
		{   
			String query="Update donation set status='received' where id=?";
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			String query0="select donation_id from donation where id=?";
			pstmt=con.prepareStatement(query0);
			pstmt.setInt(1, id);
			ResultSet rs0=pstmt.executeQuery();
			rs0.next();
			int donationid=rs0.getInt("donation_id");
			String query1="select balance_quantity from request where id = ?";
			pstmt=con.prepareStatement(query1);
			pstmt.setInt(1, donationid);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			int balance=rs.getInt(1)-donatedquantity;
			System.out.println(rs.getInt(1)+" "+donatedquantity+" "+balance);
			if(balance<=0)
			{
				String query2="Update request set status = 'Accepted',balance_quantity = ? where id = ?";
				pstmt=con.prepareStatement(query2);
				pstmt.setInt(1, 0);
				pstmt.setInt(2, donationid);
				pstmt.executeUpdate();
			}
			else
			{
				String query2="Update request set balance_quantity = ? where id = ?";
				pstmt=con.prepareStatement(query2);
				pstmt.setInt(1, balance);
				pstmt.setInt(2, donationid);
				pstmt.executeUpdate();
			}	
			
		}
		catch(Exception e)
		{
			System.out.println("acceptedDonation "+e);
		}
		
	}
  
}
