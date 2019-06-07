<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/user/createSeeker" commandName="jbs" method="post">
		<label for="username">
			Email : <form:input type="text" id="username" path="username" name="username" required="required"/>
			<font color="red"><form:errors path="username" /></font>
		</label>
		<br>
		<label for="password">
			Password : <form:input type="password" id="password" path="password" name="password" required="required"/>
			<font color="red"><form:errors path="password" /></font>
		</label>
		<br>
		<label for="first_name">
			First name : <form:input type="text" id="first_name" path="firstname" name="firstname"/>
			<font color="red"><form:errors path="firstname" /></font>
		</label>
		<br>
		<label for="last_name">
			Last name : <form:input type="text" id="last_name" path="lastname" name="lastname"/>
			<font color="red"><form:errors path="lastname" /></font>
		</label>
		<br>
		<label for="exp">
			Experience(in years) : <form:input type="text" id="exp" path="exp" name="exp"/>
			<font color="red"><form:errors path="exp" /></font>
		</label>
		<br>
		<label for="prime_skill">
			Primary Skill : <form:input type="text" id="prime_skill" path="primarySkill" name="primarySkill"/>
			<font color="red"><form:errors path="primarySkill" /></font>
		</label>
		<br>
		<input type="submit" value="Sign Up">
	</form:form>
</body>
</html>