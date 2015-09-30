package com.verizon.utils;
import java.sql.*;

import com.verizon.vo.*;

public class DBUtis {

   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net/ad_98df6a4d172d25e?user=b5ef6c1f05c429&password=056279a7";
    static{
    	try{
    	    Class.forName("com.mysql.jdbc.Driver");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
    public static Connection getConnection(){
	      System.out.println("Connecting to database...");
	      Connection conn=null;
	      try {
			   conn = DriverManager.getConnection(DB_URL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      return conn;
    }
    
    public static void closeConnection(Connection conn){
    	try {
    		if(conn!=null && conn instanceof Connection){
    			conn.close();
    			System.out.println("Closed connection..");
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public static boolean insertAll(InterviewDetail interviewDtl,Interviewee interviewee,Interviewer interviewer){
    	boolean retVal=false;
    	
		Connection conn=DBUtis.getConnection();
		if(conn!=null){
			try {
				retVal=createInterview(interviewDtl,conn) &&
				insertInterviewer(interviewer, conn) &&
				insertInterviewee(interviewee, conn);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				closeConnection(conn);
			}
		}
    	
    	return retVal;
    }
    
 
    //1.
    public static boolean createInterview(InterviewDetail interview,Connection conn){
    	boolean retVal=false;
    	
    	final String CREATE_INTERVIEW="insert into interview(INTERVIEW_DATE, INTERVIEW_TYPE, ADDL_DOCUMENT, RESULT, FEEDBACK, VENUE, EVALUATION_RESULT) values (?,?,?,?,?,?,?)";
    	
    	if(interview==null){
    		return retVal;
    	}
    	

		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(CREATE_INTERVIEW);
				ps.setDate(1,interview.getInterviewDate());
				ps.setString(2,interview.getInterviewType());
				ps.setBlob(3, interview.getAddlDocument());
				ps.setString(4, interview.getResult());
				ps.setString(5,interview.getFeedback());
				ps.setString(6,interview.getVenue());
				ps.setString(7, interview.getEvaluationResults());
				
				ps.execute();
				retVal=true;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				//closeConnection(conn);
			}
		}
    	
    	return retVal;
    }
    
    
   // 2.
    public static boolean insertInterviewee(Interviewee interviewee,Connection conn){
    	boolean returnVal=false;
    	final String INSERT_INTERVIEWEE="insert into interviewee(INTERVIEWEE_NAME, INTERVIEWEE_ORG, EMPLOYEE_ID, ADDRESS, MOBILE_NO, INTERVIEW_ID)"
    			+ " values (?,?,?,?,?,?)";
    	
    	if(interviewee==null){
    		return returnVal;
    	}
    	
		
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement(INSERT_INTERVIEWEE);
				ps.setString(1,interviewee.getIntervieweeName());
				ps.setString(2,interviewee.getIntervieweeOrg());
				ps.setInt(3, interviewee.getEmployeeID());
				ps.setString(4, interviewee.getAddress());
				ps.setString(5,interviewee.getMobileNumber());
				ps.setInt(6,getLastInsertId(conn));
				
				ps.execute();
				returnVal=true;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				//closeConnection(conn);
			}
		}
    	return returnVal;
    }
	
    //3.
    public static boolean insertInterviewer(Interviewer interviewer,Connection conn){
    	boolean retVal=false;
		if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement("INSERT INTO INTERVIEWER VALUES(?,?)");
				ps.setInt(1, getLastInsertId(conn));
				ps.setInt(2, interviewer.getInterviewerEmpId());
				ps.execute();
				retVal=true;
			}catch(Exception e){
				
			}
		}
		return retVal;
    }
    
    public static int getLastInsertId(Connection conn){
    	int returnVal=0;
    	if(conn!=null){
			try {
				PreparedStatement ps=conn.prepareStatement("select LAST_INSERT_ID()");
				ResultSet rs = ps.executeQuery();
				if(rs!=null && rs.next()){
					returnVal=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
    	}
    	return returnVal;
    }
}
