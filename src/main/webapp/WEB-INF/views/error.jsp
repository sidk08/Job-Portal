<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hired.com</title>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<style type="text/css">
body, html{
		width:90%;
		height:100%;
		margin : auto;
		font-family: 'Roboto', sans-serif;
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
</style>
</head>
<body>
<div class="main">
<div class="content">
<h2>${requestScope.msg}</h2>
<br>
<a href="${pageScope.request.contextPath}">Go Back</a>
</div>
</div>
</body>
</html>