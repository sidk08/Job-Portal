<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hired.com | Create Job</title>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<style>
	body, html{
			width:90%;
			height:100%;
			margin : auto;
			font-family: 'Roboto', sans-serif;
			}
	
	.main{
			background-color:#e8e8e8;
			height:90%;
			padding-top:2em;
		}
		
	.formInput{
			width:80%;
			background-color:#FFFFFF;
			border:1px solid #bfbfbf;
			box-shadow: 10px 10px 8px #888888;
			margin:auto;
			min-height:40%;
			padding-bottom:2em;
		}
		form{
			padding:3em;
			color:#96939b
		}
		
		form label{
			
		}
		
		form input{
			color:#96939b;
			font-size: 0.95em;
			font-weight: lighter;
			margin:1em 0.5em 1em 2em;
			
		}
		
		.formInput a:link, a:visited{
			padding : 0.8em;
			margin-left:2em;
			text-decoration: none;
			color:white;
			background-color: rgba(86, 67, 86, 0.6);
		}
		.formInput a:hover, a:active {
		 	 background-color: rgb(86, 67, 86);
		}
		
		input[type="submit"]{
		  background-color: #fc814a;
		  border: none;
		  color: white;
		  padding: 16px 32px;
		  text-align: center;
		  font-size: 16px;
		  margin: 4px 2px;
		  opacity: 0.6;
		  transition: 0.3s;
		  display: inline-block;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		input[type="submit"]:hover {opacity: 1}			
</style>
</head>
<body>
<div class="main">
<div class="formInput">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<form:form action="${contextPath}/employer/createJob" commandName="jb"	method="post">
	<h2>Create Job</h2>
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
</div>
</div>
</body>
</html>