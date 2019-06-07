<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hired.com | Available jobs</title>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<style type="text/css">
	body, html{
		width:90%;
		height:100%;
		margin : auto;
		font-family: 'Roboto', sans-serif;
		}
	header{
		height:40%;
		background-color: #564256;
		color:#FFFFFF;
		align-content: center;
		padding-top:4em;
		padding-left:1.8em;
	}
		
	header h1{
		font-size: 4em;
		margin:1em 0 0 0;
	}
	h2{
		color:#fc814a;
		font-weight: bolder;
		font-size: 2.5em;
	}
	.main{
	background-color:#e8e8e8;
	height:90%;
	padding-top:2em;
	}
	.content{
		width:90%;
		background-color:#FFFFFF;
		border:1px solid #bfbfbf;
		box-shadow: 10px 10px 8px #888888;
		margin:auto;
		min-height:40%;
		padding-bottom:2em;
		padding-left:1em;
	}
	table{
		border-collapse: collapse;
	}
	table, th, td {
  		border: 1px solid black;
	}
	th {
  height: 50px;
  background-color: #fc814a;
  color: white;
}
th, td {
  padding: 15px;
  text-align: left;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>
</head>
<body>
<header>
	<h1>Hired.com</h1>
</header>
<div class="main">
<div class="content">
<h2>Posted jobs</h2>
<div style="overflow-x:auto;">
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
</div>
<br>
<a href="${pageContext.request.contextPath}/seeker">Go Back</a>
</div>
</div>
</body>
</html>