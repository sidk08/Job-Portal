<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
	<title>Hired!</title>
	<style>
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
			font-size: 1.5em;
		}
		
		form input{
			color:#96939b;
			font-size: 0.95em;
			font-weight: lighter;
			margin-top:1.1em;
			margin-bottom:2em;
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
<header>
	<h1>Hired.com</h1>
</header>
<main>
	<div class="formInput">
		<form action="${pageContext.request.contextPath}/user/auth" method="post">
			<h1>Log In</h1>
			<br/>
			<label for="username">
				Username : <br/><input type="text" id="username" name="username" required="required">
			</label>
			<br><br>
			<label for="password">
				Password : <br/><input type="password" id="password" name="password" required="required">
			</label>
			<br>
			<input type="submit" value="Login">
		</form>
	<br><br>
	<a href="${pageContext.request.contextPath}/user/create?type=seeker">Click here to Sign up</a>&emsp;&emsp;&emsp;|&emsp;
	<a href="${pageContext.request.contextPath}/user/create?type=employer">Sign up as an Employer</a>
	</div>
		
</main>
</body>
</html>
