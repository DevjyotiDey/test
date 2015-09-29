package com.verizon.vo;


public class Employee {
	private String address;
	private String designation;
	private String emailId;
	private int employeeID;
	private String employeeName;
	private String mobileNumber;
	private String voip;
	private String vzid;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getVoip() {
		return voip;
	}
	public void setVoip(String voip) {
		this.voip = voip;
	}
	public String getVzid() {
		return vzid;
	}
	public void setVzid(String vzid) {
		this.vzid = vzid;
	}
	
	public String toString(){
		return this.vzid;
	}
}
