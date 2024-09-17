<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
    <link rel="stylesheet" href="register.css">
</head>
<body>
	<nav>
        <div class="left-nav">User Management System</div>
        <div class="right-nav">
            <a href="register.jsp"><span>Register</span></a>
            <a href="../LoginPage/login.jsp"><span>Login</span></a>
        </div>
    </nav>

    <main>
    	<%
    		String userMsg = (String) session.getAttribute("userMsg");
    		if(userMsg != null)
    		{
    	%>
    			<p class="userMsg"><%= userMsg %></p>
    	<%
    			session.removeAttribute("userMsg");
    		}
    	%>
        <form action="../userDao" method="post">
            <h2>Register</h2>
            <input type="text" name="name" placeholder="Enter your Name">
            <input type="number" name="age" placeholder="Enter your age">
            <input type="email" name="email" placeholder="Enter your Email">
            <input type="tel" name="mobile" placeholder="Enter your Mobile Number">
            <input type="password" name="password" placeholder="Enter your Password">

            <input type="submit" value="Register" class="submit-btn">
        </form>
    </main>
</body>
</html>