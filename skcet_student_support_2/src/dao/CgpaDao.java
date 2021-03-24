package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Cgpa;

public class CgpaDao {
	
	private static final String getcredit = "select subject_code , subject , credits from credit_points where sem_no=?";
	private static final String getcgpa="select * from cgpa_scores where register_no = ?";
	private static final String gettotalcgpa="select sem1,sem2,sem3,sem4,sem5,sem6,sem7,sem8 from cgpa_scores where register_no = ?  ";
	private static final String storesubject="insert into credit_points(sem_no ,subject_code , subject,credits) values(?,?,?,?) ";
	private static final String deletesubject="delete from credit_points where sem_no = ?";
	
	public ArrayList<ArrayList<String>> getCredits(String semester)
	{
		Connection con=DBConnection.getConnection();
		ArrayList<ArrayList<String>> ans=new ArrayList<ArrayList<String>>();
		try
		{
			PreparedStatement ps=con.prepareStatement(getcredit);			
			ps.setInt(1, Integer.parseInt(semester));
			ResultSet res=ps.executeQuery();
			
			while(res.next())
			{
				ArrayList<String> temp=new ArrayList<String>();
				temp.add(res.getString("subject_code"));
				temp.add(res.getString("subject"));
				temp.add(res.getString("credits"));
				ans.add(temp);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public ArrayList<Double> getCgpa(String registerNo)
	{
		Connection con=DBConnection.getConnection();
		ArrayList<Double> ans=new ArrayList<Double>();
		try
		{
			PreparedStatement pstmt = con.prepareStatement(getcgpa);
			pstmt.setString(1, registerNo);
			ResultSet res=pstmt.executeQuery();
			int i=1;
			res.next();
			while(i<8)
			{
				String a="sem"+i;
				if(!res.getString(a).equals(null))
					ans.add(Double.parseDouble(res.getString(a)));
				i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public ArrayList<Double> getTotalCgpa(String from,String to)
	{
		Connection con=DBConnection.getConnection();
		ArrayList<Double> ans=new ArrayList<Double>();
		for(int i=0;i<8;i++)
		{
			ans.add(0.0);
		}
		try
		{
			String a=from.substring(0,6);//18euit
			int fromRollNo=Integer.parseInt(from.substring(6,from.length()));
			int toRollNo=Integer.parseInt(to.substring(6,to.length()));
			for(int i=fromRollNo;i<=toRollNo;i++)
			{
				String registerNo=a+i; 
				PreparedStatement pstmt = con.prepareStatement(gettotalcgpa);
				pstmt.setString(1, registerNo);
				ResultSet res=pstmt.executeQuery();
				int j=1;
				if(res.next())
				{
					while(j<=8)
					{
						String columnName="sem"+j;
						if(res.getDouble(columnName)!=0.0)
						{
							double temp=ans.get(j-1);
							ans.set(j-1,res.getDouble(columnName)+temp);
						}
						j++;
					}
				}
			}
			int n=toRollNo-fromRollNo+1;
			for(int i=0;i<8;i++)
			{
				double temp=ans.get(i)/n;
				ans.set(i,temp);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public void deleteSubjects(int semester)
	{
		Connection con=DBConnection.getConnection();
		try
		{
			PreparedStatement ps=con.prepareStatement(deletesubject);			
			ps.setInt(1, semester);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void storeSubjects(ArrayList<Cgpa> a)
	{
		Connection con=DBConnection.getConnection();
		try
		{
			PreparedStatement ps=con.prepareStatement(storesubject);
			for(int i=0;i<a.size();i++)
			{
				Cgpa temp=a.get(i);
				ps.setInt(1, temp.getSemester());
				ps.setString(2, temp.getSubjectCode());
				ps.setString(3, temp.getSubjectName());
				ps.setDouble(4, temp.getCredits());
				ps.executeUpdate();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}