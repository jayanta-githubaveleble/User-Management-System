<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.loginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Page</title>
	<link rel="stylesheet" href="update.css">
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
		        <div class="left-nav">Update Profile</div>
		        <div class="right-nav">
		            <a href="../HomePage/userHome.jsp?email=<%=email%>">
		                <span>Profile Page</span>
		            </a>
		        </div>
		    </nav>
		    <main>
		    	<form action="../UpdateProfile" method="post">
		            <h2>Update Profile</h2>
		            <input type="text" name="name" placeholder="Enter your Name" value="<%=userName%>">
		            <input type="number" name="age" placeholder="Enter your age" value="<%=userAge%>">
		            <input type="email" name="email" placeholder="Enter your Email" value="<%=userEmail%>">
		            <input type="tel" name="mobile" placeholder="Enter your Mobile Number" value="<%=userMobile%>">
		
		            <input type="submit" value="Update" class="submit-btn">
		      	</form>
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