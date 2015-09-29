package com.verizon.vo;

import java.util.ArrayList;

public class Interviewer {

	private int interviewerEmpId;
	private Employee employee;
	private ArrayList<InterviewDetail> interviewsTaken=new ArrayList<InterviewDetail>();


	public ArrayList<InterviewDetail> getInterviews() {
		return interviewsTaken;
	}

	public void setInterviews(ArrayList<InterviewDetail> interviews) {
		this.interviewsTaken = interviews;
	}

	public int getInterviewerEmpId() {
		return interviewerEmpId;
	}

	public void setInterviewerEmpId(int interviewerEmpId) {
		this.interviewerEmpId = interviewerEmpId;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return ""+interviewerEmpId;
	}
	
	
	
}
