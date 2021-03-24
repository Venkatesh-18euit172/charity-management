package model;

public class Cgpa {

	private int semester;
	private String subjectCode;
	private String subjectName;
	private double credits;
	
	public Cgpa(int semester, String subjectCode, String subjectName, double credits) {
		super();
		this.semester = semester;
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.credits = credits;
	}
	
	public int getSemester() {
		return semester;
	}
	
	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public double getCredits() {
		return credits;
	}
	
	public void setCredits(double credits) {
		this.credits = credits;
	}
	
}