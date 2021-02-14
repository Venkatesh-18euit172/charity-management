package model;

import java.sql.Date;

public class Request {
	
	private int id;
	private String ngo_email;
	private String type_of_request;
	private int total_quantity;
	private int balance_quantity;
	private String measurements;
	private Date expected_date;
	private String request_details;
	private String status;
	
	public Request(int id, String ngo_email, String type_of_request, int total_quantity, int balance_quantity,
			String measurements, Date expected_date, String request_details, String status) {
		super();
		this.id = id;
		this.ngo_email = ngo_email;
		this.type_of_request = type_of_request;
		this.total_quantity = total_quantity;
		this.balance_quantity = balance_quantity;
		this.measurements = measurements;
		this.expected_date = expected_date;
		this.request_details = request_details;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNgo_email() {
		return ngo_email;
	}

	public void setNgo_email(String ngo_email) {
		this.ngo_email = ngo_email;
	}

	public String getType_of_request() {
		return type_of_request;
	}

	public void setType_of_request(String type_of_request) {
		this.type_of_request = type_of_request;
	}

	public int getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}

	public int getBalance_quantity() {
		return balance_quantity;
	}

	public void setBalance_quantity(int balance_quantity) {
		this.balance_quantity = balance_quantity;
	}

	public String getMeasurements() {
		return measurements;
	}

	public void setMeasurements(String measurements) {
		this.measurements = measurements;
	}

	public Date getExpected_date() {
		return expected_date;
	}

	public void setExpected_date(Date expected_date) {
		this.expected_date = expected_date;
	}

	public String getRequest_details() {
		return request_details;
	}

	public void setRequest_details(String request_details) {
		this.request_details = request_details;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
		
}