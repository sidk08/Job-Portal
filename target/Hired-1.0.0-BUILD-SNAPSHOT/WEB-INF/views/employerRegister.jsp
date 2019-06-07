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
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<form:form action="${pageContext.request.contextPath}/user/createEmployer" commandName="em" method="post">
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
		<label for="org">
			Organization Name : <form:input type="text" id="org" path="organization" name="organization" required="required"/>
			<font color="red"><form:errors path="organization" /></font>
		</label>
		<br>
		<label for="industry">
			Industry Type : <form:input type="text" id="industry" path="industry" name="industry" required="required"/>
			<font color="red"><form:errors path="industry" /></font>
		</label>
		<br>
		<input type="submit" value="Sign Up">
	</form:form>
</body>
</html>