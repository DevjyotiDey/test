package com.verizon.vo;

import java.sql.Blob;
import java.sql.Date;


public class InterviewDetail {
	private String feedback;
	private Date interviewDate;
	private int interviewId;
	private String interviewType;
	private String result;
	private String venue;
	private String evaluationResults;
	private Blob addlDocument;
	
	public Blob getAddlDocument() {
		return addlDocument;
	}
	public void setAddlDocument(Blob addlDocument) {
		this.addlDocument = addlDocument;
	}
	public String getEvaluationResults() {
		return evaluationResults;
	}
	public void setEvaluationResults(String evaluationResults) {
		this.evaluationResults = evaluationResults;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public Date getInterviewDate() {
		return interviewDate;
	}
	public void setInterviewDate(Date interviewDate) {
		this.interviewDate = interviewDate;
	}
	public int getInterviewId() {
		return interviewId;
	}
	public void setInterviewId(int interviewId) {
		this.interviewId = interviewId;
	}
	public String getInterviewType() {
		return interviewType;
	}
	public void setInterviewType(String interviewType) {
		this.interviewType = interviewType;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	

}
