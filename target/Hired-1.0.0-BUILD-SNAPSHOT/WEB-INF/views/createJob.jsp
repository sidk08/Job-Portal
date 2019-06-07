<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Job</title>
</head>
<body>
<h2>Create Job</h2>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<form:form action="${contextPath}/employer/createJob" commandName="jb"	method="post">
	<table>
		<tr>
			<td>Job Title</td>
			<td><form:input path="jobTitle" size="30" required="required" />
				<font color="red"><form:errors path="jobTitle" /></font></td>
		</tr>

		<tr>
			<td>Description</td>
			<td><form:input path="description" size="30" required="required" />
				<font color="red"><form:errors path="description" /></font></td>
		</tr>


		<tr>
			<td>Location:</td>
			<td><form:input path="location" size="30" required="required" />
				<font color="red"><form:errors path="location" /></font></td>
		</tr>

		<tr>
			<td>Skill:</td>
			<td><form:input path="skills" size="30" equired="required" /> 
			<font color="red"><form:errors path="skills" /></font></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" value="Create Job" /></td>
		</tr>
		</table>
</form:form>
<br>

<a href="${pageContext.request.contextPath}/employer">Go Back</a>

</body>
</html>