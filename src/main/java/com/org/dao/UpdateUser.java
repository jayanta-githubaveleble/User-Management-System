package com.org.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

@WebServlet("/UpdateProfile")
public class UpdateUser extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
			PreparedStatement pst = con.prepareStatement("update user.user_details set email=?,name=?,age=?,mobile=? where email=?");
			pst.setString(1, req.getParameter("email"));
			pst.setString(2, req.getParameter("name"));
			pst.setInt(3, Integer.parseInt(req.getParameter("age")));
			pst.setLong(4, Long.parseLong(req.getParameter("mobile")));
			pst.setString(5, req.getParameter("email"));
			HttpSession session = req.getSession();
			
			pst.executeUpdate();
			String data = (String)session.getAttribute("msgSentBy");
			if(data.equals("admin"))
			{
				session.removeAttribute("msgSentBy");
				resp.sendRedirect("HomePage/adminHome.jsp");
			}
			else
			{
				session.removeAttribute("msgSentBy");
				resp.sendRedirect("HomePage/userHome.jsp?email="+req.getParameter("email"));
			}
				
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
