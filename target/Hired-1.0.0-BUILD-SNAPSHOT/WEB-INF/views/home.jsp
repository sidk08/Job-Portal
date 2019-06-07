<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Hired.com</title>
</head>
<body>
<h1>
	Login to Hired.com 
</h1>

<div>
	<form action="${pageContext.request.contextPath}/user/auth" method="post">
		<label for="username">
			Username : <input type="text" id="username" name="username">
		</label>
		<br><br>
		<label for="password">
			Password : <input type="password" id="password" name="password">
		</label>
		<br>
		<input type="submit" value="Login">
	</form>
	<br><br>
	<a href="${pageContext.request.contextPath}/user/create?type=seeker">Click here to Sign up</a>&emsp;|&emsp;
	<a href="${pageContext.request.contextPath}/user/create?type=employer">Sign up as an Employer</a>
		
</div>
</body>
</html>
