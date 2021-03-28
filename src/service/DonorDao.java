package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.TreeMap;

import model.Donation;
import model.Donor;

public class DonorDao {

	private static final String getAllDonor="select * from donor";
	
	public ArrayList<Donor> getAllDonor()
	{
		ArrayList<Donor> result=new ArrayList<Donor>();
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(getAllDonor);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				String User_email=rs.getString(1);
				String Name=rs.getString(2);
				String Address=rs.getString(3);
				String Mobile_Number=rs.getString(4);
				Donor obj=new Donor(User_email, Name, Address, Mobile_Number);
				result.add(obj);
			}
		}
		catch(Exception e)
		{
			System.out.println("getAllDonor "+e);
		}
		return result;
	}
	
	public void donate(Donation obj)
	{
		try
		{
			String query="insert into donation(ngo_email,donor_email,donated_quantity,measurements,donation_id,donated_date,status) values(?,?,?,?,?,?,?)";
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,obj.getNgo_email());
			pstmt.setString(2,obj.getDonor_email());
			pstmt.setInt(3, obj.getDonated_quantity());
			pstmt.setString(4, obj.getMeasurements());
			pstmt.setInt(5, obj.getDonation_id());
			pstmt.setDate(6, obj.getDonated_date());
			pstmt.setString(7,obj.getStatus());
			pstmt.executeUpdate();

			
		}
		catch(Exception e)
		{
			System.out.println("donate "+e);
		}
	}
	
	public ArrayList<ArrayList<String>> showDonation(String email)
	{   System.out.println(email);
		ArrayList<ArrayList<String>> result=new ArrayList<ArrayList<String>>();
		String query="SELECT request.type_of_request ,  donation.donated_quantity , donation.measurements , donation.donated_date , ngo.Name , ngo.Address , ngo.Mobile_Number ,request.ngo_email, request.request_details  FROM donation INNER JOIN request on donation.donation_id=request.id INNER JOIN ngo on request.ngo_email=ngo.User_email where donation.donor_email=?";
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				ArrayList<String> res=new ArrayList<String>();
				res.add(rs.getString(1));
				res.add(String.valueOf(rs.getString(2))+" "+rs.getString(3));
				String date[]=String.valueOf(rs.getDate(4)).split("-");
				String yyyy=date[0];String dd=date[1];String mm=date[2];
				res.add(dd+"-"+mm+"-"+yyyy);
				res.add(rs.getString(5));
				res.add(rs.getString(6));
				res.add(rs.getString(7));
				res.add(rs.getString(8));
				res.add(rs.getString(9));
				result.add(res);
			}
		}
		catch(Exception e)
		{
			System.out.println("showDonation "+e);
		}
		return result;
	}
	
	public TreeMap<String,Integer> showPiechart(String email)
	{
		TreeMap<String,Integer> res=new TreeMap<String,Integer>();
		String query="SELECT request.type_of_request FROM request INNER JOIN donation ON request.id=donation.donation_id WHERE donation.donor_email=?";
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				String type=rs.getString(1);
				if(res.containsKey(type))
					res.put(type, res.get(type)+1);
				else
					res.put(type, 1);
			}
		}
		catch(Exception e)
		{
			System.out.println("showPiechart "+e);
		}
		return res;
	}
}
