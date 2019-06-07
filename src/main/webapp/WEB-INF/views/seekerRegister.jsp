<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hired.com</title>
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
	<form:form action="${pageContext.request.contextPath}/user/createSeeker" commandName="jbs" method="post">
		<h1>Sign Up</h1>
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
		<br/>
		<input type="submit" value="Sign Up">
	</form:form>
	</div>
	</div>
</body>
</html>