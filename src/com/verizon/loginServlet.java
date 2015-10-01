package com.verizon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.verizon.vo.*;
import com.verizon.utils.CommonUtils;


public class loginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public loginServlet()
    {
        super();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	doPost(request,response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			String vzId = (String)request.getParameter("empid");
			String pwd = (String)request.getParameter("password");
			HttpSession httpSession=null;
			Employee employee=null;
			// For local testing
			//request.setAttribute("name", "Test");
			//request.getRequestDispatcher("intview.jsp").forward(request, response);
			if(request.getSession(flase)==null){
				employee = CommonUtils.getEmployee(vzId);
				System.out.println("employee =" + employee.getVzid());
			}else{
				employee=(Employee) request.getSession(flase).getAttribute("Employee");
				pwd = CommonUtils.getSSOPassword();
			}
			
			boolean authenticated=CommonUtils.authenticateUser(employee,pwd);
			if(authenticated)
			{
				httpSession=request.getSession();
				//httpSession.setMaxInactiveInterval(5*60);
				httpSession.setAttribute("Employee", employee);
				httpSession.setAttribute("EmployeeName",employee.getEmployeeName());
				request.setAttribute("name", employee.getEmployeeName());

				
				Interviewee interviewee=CommonUtils.getInterviewee(employee);
				Interviewer interviewer=CommonUtils.getInterviewer(employee);
				if(interviewee!=null){
					request.setAttribute("interviewee", interviewee);
				}
				if(interviewer!=null){
					request.setAttribute("interviewer", interviewer);
				}
				request.getRequestDispatcher("intview.jsp").forward(request, response);
			}
			else
			{
				System.out.println("Invalid credentials");
				request.setAttribute("message", "ERROR! Please verify your login credentials!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
