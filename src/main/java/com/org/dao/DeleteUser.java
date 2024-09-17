package com.org.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
		
		if(req.getParameter("showDelete") != null)
		{
			session.setAttribute("showDelete","true");
			resp.sendRedirect("HomePage/userHome.jsp?email="+req.getParameter("email"));
		}
		if(req.getParameter("user").equals("admin"))
		{
			deleteByEmail(req.getParameter("email"));
			resp.sendRedirect("HomePage/adminHome.jsp");
		}
		else
		{
			deleteByEmail(req.getParameter("email"));
			session.setAttribute("loginStatus", "Profile Deleted Successfully.");
			resp.sendRedirect("LoginPage/login.jsp");
		}
			
	}
	
	public void deleteByEmail(String email)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
			PreparedStatement pst = con.prepareStatement("delete from user.user_details where email=?");
			pst.setString(1, email);
			pst.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
