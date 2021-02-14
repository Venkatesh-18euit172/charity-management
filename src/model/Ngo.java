package model;

public class Ngo {

	private String User_email;
	private String Name;
	private String Address;
	private String Mobile_Number;
	private String Document_Link;
	private String Status;
	
	public Ngo(String user_email, String name, String address, String mobile_Number, String document_Link,
			String status) {
		super();
		User_email = user_email;
		Name = name;
		Address = address;
		Mobile_Number = mobile_Number;
		Document_Link = document_Link;
		Status = status;
	}
	
	public String getUser_email() {
		return User_email;
	}
	public void setUser_email(String user_email) {
		User_email = user_email;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getMobile_Number() {
		return Mobile_Number;
	}
	public void setMobile_Number(String mobile_Number) {
		Mobile_Number = mobile_Number;
	}
	public String getDocument_Link() {
		return Document_Link;
	}
	public void setDocument_Link(String document_Link) {
		Document_Link = document_Link;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
		
}