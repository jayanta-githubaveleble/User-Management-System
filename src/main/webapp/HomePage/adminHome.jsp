<%@page import="com.org.dto.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.dao.loginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Home Page</title>
	<link rel="stylesheet" href="adminHome.css">
</head>
<body>
	<%
		if(session.getAttribute("adminLogin") != null)
		{
	%>
		    <nav>
		        <div class="left-nav">Admin Profile</div>
		        <div class="right-nav">
		            <a href="../LoginPage/login.jsp">
		                <span>Logout</span>
		            </a>
		        </div>
		    </nav>
		    <main>
		    
		        <div class="container">
		            <section class="left-container">
		                <div class="profile-image">
		                    <span>
		                        <img src="admin-icon.jpg" alt="Profile-Photo">
		                    </span>
		                    <h2>Admin</h2>
		                </div>
		                <div class="profile-btn">
		                    <a href="#">
		                        <span>Edit</span>
		                    </a>
		                </div>
		            </section>
		            <section class="right-container">
		                <h1>User's Detail</h1>
		                <div class="profile-details">
		                    <%
		                    	loginUser user = new loginUser();
		                    	ArrayList<User> userList = user.userList();
		                    	
		                    	for(User eachUser : userList)
		                    	{
		                    		String name = eachUser.getName();
		                    		int age = eachUser.getAge();
		                    		String email = eachUser.getEmail();
		                    		long mobile = eachUser.getMobile();
		                    		
		                    		%>
		                    			<div class="user-profile">
					                        <section class="profile-left">
					                                <section>
					                                    <span>Name</span>
					                                    <span><%=name %></span>
					                                </section>
					                                <section>
					                                    <span>Age</span>
					                                    <span><%=age %></span>
					                                </section>
					                                <section>
					                                    <span>Email</span>
					                                    <span><%=email %></span>
					                                </section>
					                                <section>
					                                    <span>Mobile</span>
					                                    <span><%=mobile %></span>
					                                </section>
					                        </section>
					                        <section class="profile-right">
					                        	<% session.setAttribute("msgSentBy", "admin"); %>
					                            <a href="../updatePage/update.jsp?email=<%=email%>">
					                                <span>Edit</span>
					                            </a>
					                            <a href="../deleteUser?email=<%=email%>&user=admin">
					                                <span>Delete</span>
					                            </a>
					                        </section>
		                    			</div>
		                    		<%
		                    	}
		                    %>
		                </div>
		            </section>
		        </div>
		    </main>
		<%
			}
			else
			{
				response.sendRedirect("../LoginPage/login.jsp");
			}
		%>
</body>
</html>