package com.verizon.vo;

public class Interviewer {

	private int evaluationId;
	private int interviewId;
	private int interviewerEmpId;
	
	private Employee employee;

	public int getEvaluationId() {
		return evaluationId;
	}

	public void setEvaluationId(int evaluationId) {
		this.evaluationId = evaluationId;
	}

	public int getInterviewId() {
		return interviewId;
	}

	public void setInterviewId(int interviewId) {
		this.interviewId = interviewId;
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
	
	
	
}
