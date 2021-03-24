package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Student;

public class StudentDao {

	private static final String insertQuery = "insert into students(register_no, name, department, section, email, phone, password) values(?, ?, ?, ?, ?, ?, ?)";
	private static final String updateQuery = "update students set password = ? where register_no = ?";
	private static final String checkQuery = "select * from students where register_no = ? and password = ?";
	private Connection con;
	
	public StudentDao() {
		con = DBConnection.getConnection();
	}
	
	public void save(Student student) {
		
		try {
			PreparedStatement ps = con.prepareStatement(insertQuery);
			ps.setString(1, student.getRegisterNo());
			ps.setString(2, student.getName());
			ps.setString(3, student.getDepartment());
			ps.setString(4, student.getSection()+"");
			ps.setString(5, student.getEmail());
			ps.setString(6, student.getPhone());
			ps.setString(7, student.getPassword());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void updatePassword(String registerNo, String password) {
		
		try {
			PreparedStatement ps = con.prepareStatement(updateQuery);
			ps.setString(1, password);
			ps.setString(2, registerNo.toLowerCase());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Student fetchUser(String registerNo, String password) {
		
		ResultSet rs = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(checkQuery);
			ps.setString(1, registerNo.toLowerCase());
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				char section = rs.getString("section").charAt(0);
				Student student = new Student(registerNo, name, section, phone);
				return student;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return null;
	}
}
