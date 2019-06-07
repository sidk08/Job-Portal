<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Posted Jobs</title>
<style type="text/css">
	th,td{
	border: 1px solid black;
	}
</style>
</head>
<body>
<h2>Created job</h2>
<table>
<thead>
	<tr>
	<th>Job Title</th>
	<th>Job Description</th>
	<th>Job location</th>
	<th>Skill</th>
	<th>Actions</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.jobList}" var="job">
	<tr>
		<td>${job.jobTitle}</td>
		<td>${job.description}</td>
		<td>${job.location}</td>
		<td>${job.skills}</td>
		<td><a href="${pageContext.request.contextPath}/employer/deleteJob?jobid=${job.jobId}">Delete</a>&emsp;
		<a href="${pageContext.request.contextPath}/employer/updateJob?jobid=${job.jobId}">Update</a></td>
	</tr>
	</c:forEach>
</tbody>
</table>
<br>
<a href="${pageContext.request.contextPath}/employer">Go Back</a>
</body>
</html>