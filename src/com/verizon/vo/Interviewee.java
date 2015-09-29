package com.verizon.vo;

import java.util.ArrayList;
public class Interviewee {
	private String address;
	private int employeeID;
	private int intervieweeId;
	private String intervieweeName;
	private String intervieweeOrg;
	private String mobileNumber;
	
	private Employee employee;
	private ArrayList<InterviewDetail> interviewsGiven=new ArrayList<InterviewDetail>();
	
	public ArrayList<InterviewDetail> getInterviewsGiven() {
		return interviewsGiven;
	}
	public void setInterviewsGiven(ArrayList<InterviewDetail> interviews) {
		this.interviewsGiven = interviews;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public int getIntervieweeId() {
		return intervieweeId;
	}
	public void setIntervieweeId(int intervieweeId) {
		this.intervieweeId = intervieweeId;
	}
	public String getIntervieweeName() {
		return intervieweeName;
	}
	public void setIntervieweeName(String intervieweeName) {
		this.intervieweeName = intervieweeName;
	}
	public String getIntervieweeOrg() {
		return intervieweeOrg;
	}
	public void setIntervieweeOrg(String intervieweeOrg) {
		this.intervieweeOrg = intervieweeOrg;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	public String toString() {
		return ""+intervieweeId;
	}

}
