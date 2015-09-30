package com.verizon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.verizon.vo.*;
import com.verizon.utils.CommonUtils;
import com.verizon.utils.DBUtis;


public class feedServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public feedServlet()
    {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	doPost(request,response);
    }
    
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{   
			if(request.getSession(false) == null){
				request.setAttribute("message", "OOPS!! Session expired, plz Login");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			Employee emp=(Employee)request.getSession(false).getAttribute("Employee");
			String vzId = emp.getVzid();
			String pwd = (String)request.getParameter("password");
			
			InterviewDetail intDet = new InterviewDetail();
			intDet.setIntervieweeName(request.getParameter("cndName"));
			intDet.setFeedback(request.getParameter("intRem"));
			
			intDet.setVenue(request.getParameter("intVenue"));
			intDet.setInterviewType(request.getParameter("intEvent"));
			intDet.setResult(request.getParameter("intRslt"));
			
			intDet.setEvaluationResults(request.getParameter("intC1") + "," + request.getParameter("intC2") + "," + request.getParameter("intC3") + ","
				+ request.getParameter("intC4") + "," + request.getParameter("intC5") + "," + request.getParameter("intC6"));
			
			Interviewee interviewee = new Interviewee();
			interviewee.setAddress(request.getParameter("contNo"));
			interviewee.setMobileNumber(request.getParameter("contNo"));
			interviewee.setIntervieweeName(request.getParameter("cndName"));
			
			Interviewer interviewer = new Interviewer();

			interviewer.setInterviewerEmpId(emp.getEmployeeID());
			
			if(!DBUtis.insertAll(intDet, interviewee, interviewer))
			{
				System.out.println("Unable to add interview details");
				request.setAttribute("message", "ERROR!! Unable to update interview details.");
			}else{
				System.out.println("Added interview details");
				request.setAttribute("message", "SUCCESS!! Stored interview details.");
			}
			request.getRequestDispatcher("/intview.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
