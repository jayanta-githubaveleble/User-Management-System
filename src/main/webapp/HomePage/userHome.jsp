<%@page import="com.org.dao.loginUser"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User Home Page</title>
	<link rel="stylesheet" href="userHome.css">
</head>
<body>
	<%
		if(session.getAttribute("loginMsg") != null)
		{
			String email = request.getParameter("email");
			loginUser userDetails = new loginUser();
			User user = userDetails.fetchUserByEmail(email);
			
			String userName = user.getName();
			int userAge = user.getAge();
			String userEmail = user.getEmail();
			long userMobile = user.getMobile();
			String userPassword = user.getPassword();
			
	%>
	
			<nav>
		        <div class="left-nav">User Profile</div>
		        <div class="right-nav">
		            <a href="../LoginPage/login.jsp">
		                <span>Logout</span>
		            </a>
		        </div>
		    </nav>
		    <main>
		    	<%
		    		if(session.getAttribute("showDelete") != null)
		    		{
		    			session.removeAttribute("showDelete");
		    	%>
		    			<div class="delete-option">
				    		<h2>Are you sure to delete your Profile ? </h2>
				    		<div class="delete-btn">
				                    <a href="../deleteUser?email=<%=userEmail%>">
				                        <span>Yes</span>
				                    </a>
				                    <a href="userHome.jsp?email=<%=userEmail%>">
				                        <span>No</span>
				                    </a>
				           	</div>
			    		</div>
			    <%
		    		}
		    	%>
		    	
		        <div class="container">
		            <section class="left-container">
		                <div class="profile-image">
		                    <span>
		                        <img src="user-icon.png" alt="Profile-Photo">
		                    </span>
		                    <h2><%= userName %></h2>
		                </div>
		                <div class="profile-btn">
		                    <a href="../updatePage/update.jsp?email=<%=userEmail%>">
		                        <span>Edit</span>
		                    </a>
		                    <a href="../deleteUser?email=<%=userEmail%>&showDelete=true">
		                        <span>Delete</span>
		                    </a>
		                </div>
		            </section>
		            <section class="right-container">
		                <h1>Profile Details</h1>
		                <div class="profile-details">
		                    <section>
		                        <span>Name</span>
		                        <span><%= userName %></span>
		                    </section>
		                    <section>
		                        <span>Age</span>
		                        <span><%= userAge %></span>
		                    </section>
		                    <section>
		                        <span>Email</span>
		                        <span><%= userEmail %></span>
		                    </section>
		                    <section>
		                        <span>Mobile</span>
		                        <span><%= userMobile %></span>
		                    </section>
		                    <section>
		                        <span>Password</span>
		                        <span><%= userPassword %></span>
		                    </section>
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