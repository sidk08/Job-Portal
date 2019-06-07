<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hire.com</title>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<style>
	body, html{
			width:90%;
			height:100%;
			margin : auto;
			font-family: 'Roboto', sans-serif;
			}
	
	main{
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
		  margin: 6px 2px;
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
<main>
	<div class="formInput">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<form:form action="${pageContext.request.contextPath}/user/createEmployer" commandName="em" method="post">
	<h1>Employer Sign Up</h1>
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
		<br/>
		<input type="submit" value="Sign Up">
	</form:form>
	</div>
	</main>
</body>
</html>