package com.verizon.utils;

import java.sql.*;
import java.util.ArrayList;

import com.verizon.vo.*;

public class CommonUtils {
	
	public static Employee getEmployee(String vzId){
		System.out.println("Entering getEmployee("+vzId+")");
		Employee employee = null;
		final String  EMP_QUERY="SELECT * FROM EMPLOYEE WHERE VZID=?";
		Connection conn=DBUtis.getConnection();
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(EMP_QUERY);
				ps.setString(1,vzId);
				ResultSet rs=ps.executeQuery();
				if(rs!=null && rs.next()){
					System.out.println("Got results from DB");
					employee = new Employee();
					employee.setAddress(rs.getString("ADDRESS"));
					employee.setDesignation(rs.getString("DESIGNATION"));
					employee.setEmailId(rs.getString("EMAIL_ID"));
					employee.setEmployeeID(rs.getInt("EMPLOYEE_ID"));
					employee.setEmployeeName(rs.getString("EMPLOYEE_NAME"));
					employee.setMobileNumber(rs.getString("MOBILE_NO"));
					employee.setVoip(rs.getString("VOIP"));
					employee.setVzid(rs.getString("VZID"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtis.closeConnection(conn);
			}
		}else{
			System.out.println("Unable to obtain connection");
		}
		System.out.println("Exiting getEmployee() with employee="+employee);
		return employee;
	}


	public static Employee getEmployee(int empId){
		System.out.println("Entering getEmployee("+empId+")");
		Employee employee = null;
		final String  EMP_QUERY="SELECT * FROM EMPLOYEE WHERE EMPLOYEE_ID=?";
		Connection conn=DBUtis.getConnection();
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(EMP_QUERY);
				ps.setInt(1,empId);
				ResultSet rs=ps.executeQuery();
				if(rs!=null  && rs.next()){
					System.out.println("Got results from DB");
					employee = new Employee();
					employee.setAddress(rs.getString("ADDRESS"));
					employee.setDesignation(rs.getString("DESIGNATION"));
					employee.setEmailId(rs.getString("EMAIL_ID"));
					employee.setEmployeeID(rs.getInt("EMPLOYEE_ID"));
					employee.setEmployeeName(rs.getString("EMPLOYEE_NAME"));
					employee.setMobileNumber(rs.getString("MOBILE_NO"));
					employee.setVoip(rs.getString("VOIP"));
					employee.setVzid(rs.getString("VZID"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtis.closeConnection(conn);
			}
		}else{
			System.out.println("Unable to obtain connection");
		}
		System.out.println("Exiting getEmployee() with employee="+employee);
		return employee;
	}
	
	
	public static boolean authenticateUser(Employee employee,String password){
		boolean authenticated=false;
		System.out.println("Entering authenticateUser("+employee+","+password+")");
		final String SSO_MATCH="SELECT * FROM SSO_CREDENTIAL WHERE VZID=?";
		Connection conn=DBUtis.getConnection();
		
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(SSO_MATCH);
				ps.setString(1,employee.getVzid());
				ResultSet rs=ps.executeQuery();
				if(rs!=null && rs.next()){
					System.out.println("Got results from DB");
					if(password!=null && password.equalsIgnoreCase(rs.getString("PASSWORD")))
						 authenticated=true;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtis.closeConnection(conn);
			}
		}else{
			System.out.println("Unable to obtain connection");
		}
		
		System.out.println("Exiting authenticateUser() with result="+authenticated);
		return authenticated;
	}
	
	public static Interviewee getInterviewee(Employee e){
		Interviewee interviewee=null;
		ArrayList<InterviewDetail> interviewsGiven=null;
		InterviewDetail interview=null;
		
		System.out.println("Entering getInterviewee("+e+")");
		
		
		final String GET_INTERVIEWEE="SELECT intwe.INTERVIEWEE_NAME, intwe.INTERVIEWEE_ORG, intwe.EMPLOYEE_ID, intwe.ADDRESS,"
				+ " intwe.MOBILE_NO, intwe.INTERVIEWEE_ID,intv.* FROM INTERVIEWEE intwe, INTERVIEW intv WHERE"
				+ " intwe.INTERVIEW_ID=intv.INTERVIEW_ID  and intwe.EMPLOYEE_ID=?";
		
		Connection conn=DBUtis.getConnection();
		
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(GET_INTERVIEWEE);
				ps.setInt(1,e.getEmployeeID());
				ResultSet rs=ps.executeQuery();
				while(rs!=null && rs.next()){
					System.out.println("Got results from DB");
					if(interviewee==null){
						interviewee = new Interviewee();
						interviewsGiven=new ArrayList<InterviewDetail>();
						interviewee.setAddress(rs.getString("ADDRESS"));
						interviewee.setEmployeeID(rs.getInt("EMPLOYEE_ID"));
						interviewee.setIntervieweeId(rs.getInt("INTERVIEWEE_ID"));
						interviewee.setIntervieweeName(rs.getString("INTERVIEWEE_NAME"));
						interviewee.setIntervieweeOrg(rs.getString("INTERVIEWEE_ORG"));
						interviewee.setMobileNumber(rs.getString("MOBILE_NO"));
					}
					if(interviewsGiven!=null){
						 interview=new InterviewDetail();
						 interview.setAddlDocument(rs.getBlob("ADDL_DOCUMENT"));
						 interview.setInterviewId(rs.getInt("INTERVIEW_ID"));
						 interview.setFeedback(rs.getString("FEEDBACK"));
						 interview.setInterviewDate(rs.getDate("INTERVIEW_DATE"));
						 interview.setEvaluationResults(rs.getString("EVALUATION_RESULT"));
						 interview.setInterviewType(rs.getString("INTERVIEW_TYPE"));
						 interview.setResult(rs.getString("RESULT"));
						 interview.setVenue(rs.getString("VENUE"));
						 interviewsGiven.add(interview);
					}
				}
				if(interviewee!=null){
					interviewee.setInterviewsGiven(interviewsGiven);
				}
			} catch (Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}finally{
				DBUtis.closeConnection(conn);
			}
			
			if(interviewee.getIntervieweeOrg()!=null && "VERIZON".equalsIgnoreCase(interviewee.getIntervieweeOrg()) && interviewee.getEmployeeID()!=0){
				Employee emp=getEmployee(interviewee.getEmployeeID());
				interviewee.setEmployee(emp);
			}
		}else{
			System.out.println("Unable to obtain connection");
		}
		System.out.println("Exiting getInterviewee() with interviewee="+interviewee);
		return interviewee;
	}
	

	public static Interviewee getInterviewee(Interviewee interviewee){
		ArrayList<InterviewDetail> interviewsGiven=null;
		InterviewDetail interview=null;
		
		System.out.println("Entering getInterviewee("+interviewee+")");
		
		
		final String GET_INTERVIEWEE="SELECT intwe.INTERVIEWEE_NAME, intwe.INTERVIEWEE_ORG, intwe.EMPLOYEE_ID, intwe.ADDRESS,"
				+ " intwe.MOBILE_NO, intwe.INTERVIEWEE_ID,intv.* FROM INTERVIEWEE intwe, INTERVIEW intv WHERE"
				+ " intwe.INTERVIEW_ID=intv.INTERVIEW_ID  and intwe.INTERVIEWEE_ID=?";
		
		Connection conn=DBUtis.getConnection();
		
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(GET_INTERVIEWEE);
				ps.setInt(1,interviewee.getIntervieweeId());
				ResultSet rs=ps.executeQuery();
				while(rs!=null && rs.next()){
					System.out.println("Got results from DB");
					if(interviewee==null){
						interviewee = new Interviewee();
						interviewsGiven=new ArrayList<InterviewDetail>();
						interviewee.setAddress(rs.getString("ADDRESS"));
						interviewee.setEmployeeID(rs.getInt("EMPLOYEE_ID"));
						interviewee.setIntervieweeId(rs.getInt("INTERVIEWEE_ID"));
						interviewee.setIntervieweeName(rs.getString("INTERVIEWEE_NAME"));
						interviewee.setIntervieweeOrg(rs.getString("INTERVIEWEE_ORG"));
						interviewee.setMobileNumber(rs.getString("MOBILE_NO"));
					}
					if(interviewsGiven!=null){
						 interview=new InterviewDetail();
						 interview.setAddlDocument(rs.getBlob("ADDL_DOCUMENT"));
						 interview.setInterviewId(rs.getInt("INTERVIEW_ID"));
						 interview.setFeedback(rs.getString("FEEDBACK"));
						 interview.setInterviewDate(rs.getDate("INTERVIEW_DATE"));
						 interview.setEvaluationResults(rs.getString("EVALUATION_RESULT"));
						 interview.setInterviewType(rs.getString("INTERVIEW_TYPE"));
						 interview.setResult(rs.getString("RESULT"));
						 interview.setVenue(rs.getString("VENUE"));
						 interviewsGiven.add(interview);
					}
				}
				if(interviewee!=null){
					interviewee.setInterviewsGiven(interviewsGiven);
				}
			} catch (Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}finally{
				DBUtis.closeConnection(conn);
			}
			
			if(interviewee.getIntervieweeOrg()!=null && "VERIZON".equalsIgnoreCase(interviewee.getIntervieweeOrg()) && interviewee.getEmployeeID()!=0){
				Employee emp=getEmployee(interviewee.getEmployeeID());
				interviewee.setEmployee(emp);
			}
		}else{
			System.out.println("Unable to obtain connection");
		}
		System.out.println("Exiting getInterviewee() with interviewee="+interviewee);
		return interviewee;
	}


	public static Interviewer getInterviewer(Employee employee) {
		Interviewer interviewer=null;
		ArrayList<InterviewDetail> interviewsTaken=null;
		InterviewDetail interview=null;
		
		System.out.println("Entering getInterviewer("+employee+")");
		
		final String GET_INTERVIEWER="SELECT invr.INTERVIEWER_EMP_ID,inv.* FROM "
				+ "interviewer invr,interview inv WHERE "
				+ "invr.INTERVIEW_ID=inv.INTERVIEW_ID and invr.INTERVIEWER_EMP_ID=?";
		
		Connection conn=DBUtis.getConnection();
		
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(GET_INTERVIEWER);
				ps.setInt(1,employee.getEmployeeID());
				ResultSet rs=ps.executeQuery();
				
				while(rs!=null && rs.next()){
					System.out.println("Got results from DB");
					
					if(interviewer==null){
						interviewer = new Interviewer();
						interviewsTaken=new ArrayList<InterviewDetail>();
						interviewer.setInterviewerEmpId(rs.getInt("INTERVIEWER_EMP_ID"));
					}
					if(interviewsTaken!=null){
						 interview=new InterviewDetail();
						 interview.setAddlDocument(rs.getBlob("ADDL_DOCUMENT"));
						 interview.setInterviewId(rs.getInt("INTERVIEW_ID"));
						 interview.setFeedback(rs.getString("FEEDBACK"));
						 interview.setInterviewDate(rs.getDate("INTERVIEW_DATE"));
						 interview.setEvaluationResults(rs.getString("EVALUATION_RESULT"));
						 interview.setInterviewType(rs.getString("INTERVIEW_TYPE"));
						 interview.setResult(rs.getString("RESULT"));
						 interview.setVenue(rs.getString("VENUE"));
						 interviewsTaken.add(interview);
					}
				}
				if(interviewer!=null){
					interviewer.setInterviews(interviewsTaken);
				}
			} catch (Exception ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}finally{
				DBUtis.closeConnection(conn);
			}
			
			if(interviewer.getInterviewerEmpId()!=0){
				Employee e=getEmployee(interviewer.getInterviewerEmpId());
				if(e!=null){
					interviewer.setEmployee(e);
				}
			}
			
			
		}else{
			System.out.println("Unable to obtain connection");
		}
		System.out.println("Exiting getInterviewer() with interviewer="+interviewer);	
		return interviewer;
	}
	
}
