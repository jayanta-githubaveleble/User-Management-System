<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <nav>
        <div class="left-nav">User Management System</div>
        <div class="right-nav">
            <a href="../RegisterPage/register.jsp"><span>Register</span></a>
            <a href="login.jsp"><span>Login</span></a>
        </div>
    </nav>

    <main>
    	<%
    		String loginStatus = (String) session.getAttribute("loginStatus");
    	
    		if(loginStatus != null)
    		{
    	%>
    			<p class="userMsg"><%= loginStatus %></p>
    	<%
    			session.removeAttribute("loginStatus");
    		}
    	%>
    	
        <form action="../loginUser" method="post">
            <h2>Login</h2>
            <input type="email" name="email" placeholder="Enter your Email">
            <input type="password" name="password" placeholder="Enter your Password">

            <input type="submit" value="Login" class="submit-btn">
        </form>
    </main>
</body>
</html>