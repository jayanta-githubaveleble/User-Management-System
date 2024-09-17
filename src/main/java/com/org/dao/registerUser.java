package com.org.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dto.User;

@WebServlet("/userDao")
public class registerUser extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String email = req.getParameter("email");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		String password = req.getParameter("password");
		
		User user = new User();
		user.setName(name);
		user.setAge(Integer.parseInt(age));
		user.setEmail(email);
		user.setMobile(mobile);
		user.setPassword(password);
		
//		ArrayList<User> userList = new ArrayList<User>();
//		userList.add(user);
		
		addUser(user);
		
		HttpSession session = req.getSession();
		session.setAttribute("userMsg", "Registered Successfully");
//		session.setAttribute("userList", userList);
		
		resp.sendRedirect("RegisterPage/register.jsp");
	}
	
	public void addUser(User user)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
			PreparedStatement pst = con.prepareStatement("insert into user.user_details(name,age,email,mobile,password) values(?,?,?,?,?)");
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setString(3, user.getEmail());
			pst.setLong(4, user.getMobile());
			pst.setString(5, user.getPassword());
			
			pst.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}
}
