package com.org.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dto.User;

@WebServlet("/loginUser")
public class loginUser extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		
		if(email.equals("admin@gmail.com") && password.equals("admin"))
		{
			session.setAttribute("adminLogin", "valid");
			session.setAttribute("loginMsg", "valid");
			resp.sendRedirect("HomePage/adminHome.jsp");
		}
		else
		{
			try 
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
				PreparedStatement pst = con.prepareStatement("select * from user.user_details where email=? and password=?");
				pst.setString(1, email);
				pst.setString(2, password);
				ResultSet rs = pst.executeQuery();
				
				if(rs.next())
				{
					session.setAttribute("loginMsg", "valid");
					resp.sendRedirect("HomePage/userHome.jsp?email="+email);
				}
				else
				{
					session.setAttribute("loginStatus", "Invalid Credential");
					resp.sendRedirect("LoginPage/login.jsp");
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}

	}
	
	public User fetchUserByEmail(String email)
	{
		User user = new User();
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
			PreparedStatement pst = con.prepareStatement("select * from user.user_details where email=?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next())
			{
				user.setName(rs.getString("name"));
				user.setAge(rs.getInt("age"));
				user.setEmail(rs.getString("email"));
				user.setMobile(rs.getLong("mobile"));
				user.setPassword(rs.getString("password"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public ArrayList<User> userList()
	{
		ArrayList<User> list = new ArrayList<User>();
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
			PreparedStatement pst = con.prepareStatement("select * from user.user_details");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				User user = new User();
				
				user.setName(rs.getString("name"));
				user.setAge(rs.getInt("age"));
				user.setEmail(rs.getString("email"));
				user.setMobile(rs.getLong("mobile"));
				user.setPassword(rs.getString("password"));
				
				list.add(user);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}
	
}
