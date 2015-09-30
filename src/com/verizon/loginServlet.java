package com.verizon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.verizon.vo.*;
import com.verizon.utils.CommonUtils;


public class loginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public loginServlet()
    {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			String vzId = (String)request.getParameter("empid");
			String pwd = (String)request.getParameter("password");
			Employee employee = CommonUtils.getEmployee(vzId);
			System.out.println("employee =" + employee.getVzid());
			
			boolean authenticated=CommonUtils.authenticateUser(employee,pwd);
			if(authenticated)
			{
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
