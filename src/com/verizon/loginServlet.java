package com.verizon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			String id = (String)request.getParameter("empid");
			String pwd = (String)request.getParameter("password");
			
			if(!"".equalsIgnoreCase(id) || !"".equalsIgnoreCase(pwd))
			{
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
