package model;

import java.sql.Date;

public class Donation {

	private String ngo_email;
	private String donor_email;
	private int donated_quantity;
	private String measurements;
	private int donation_id;
	private Date donated_date;
	
	public Donation(String ngo_email, String donor_email, int donated_quantity, String measurements, int donation_id,
			Date donated_date) {
		super();
		this.ngo_email = ngo_email;
		this.donor_email = donor_email;
		this.donated_quantity = donated_quantity;
		this.measurements = measurements;
		this.donation_id = donation_id;
		this.donated_date = donated_date;
	}

	public String getNgo_email() {
		return ngo_email;
	}

	public void setNgo_email(String ngo_email) {
		this.ngo_email = ngo_email;
	}

	public String getDonor_email() {
		return donor_email;
	}

	public void setDonor_email(String donor_email) {
		this.donor_email = donor_email;
	}

	public int getDonated_quantity() {
		return donated_quantity;
	}

	public void setDonated_quantity(int donated_quantity) {
		this.donated_quantity = donated_quantity;
	}

	public String getMeasurements() {
		return measurements;
	}

	public void setMeasurements(String measurements) {
		this.measurements = measurements;
	}

	public int getDonation_id() {
		return donation_id;
	}

	public void setDonation_id(int donation_id) {
		this.donation_id = donation_id;
	}

	public Date getDonated_date() {
		return donated_date;
	}

	public void setDonated_date(Date donated_date) {
		this.donated_date = donated_date;
	}
	
}
