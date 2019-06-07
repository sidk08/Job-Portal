<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available jobs</title>
<style type="text/css">
	table{
	border: 1px solid black;
	}
	th,td{
	border: 1px solid black;
	}
</style>
</head>
<body>
<h2>Available jobs</h2>
<table>
<thead>
	<tr>
	<th>Job Title</th>
	<th>Job Description</th>
	<th>Job location</th>
	<th>Skill</th>
	<th>Posted By</th>
	<th>Posted On</th>
	<th>Action</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${requestScope.jobList}" var="job">
		<tr>
			<td>${job.jobTitle}</td>
			<td>${job.description}</td>
			<td>${job.location}</td>
			<td>${job.skills}</td>
			<td>${job.postedBy}</td>
			<td>${job.postedOn}</td>
			<td><a href="${pageContext.request.contextPath}/seeker/applyJob?jobid=${job.jobId}">Apply</a></td>
		</tr>
	</c:forEach>
</tbody>
</table>
<br>
<a href="${pageContext.request.contextPath}/seeker">Go Back</a>
</body>
</html>