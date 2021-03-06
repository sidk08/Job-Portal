<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hired.com | ${sessionScope.jbs.firstname}&nbsp;${sessionScope.jbs.lastname}</title>
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
		ul {
		  list-style-type: none;
		  margin: 0;
		  padding: 0;
		  overflow: hidden;
		  background-color: #fc814ab0;
		}
		
		li {
		  float: left;
		}
		
		li a {
		  display: block;
		  color: white;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		}
		
		/* Change the link color to #111 (black) on hover */
		li a:hover {
		  background-color: #fc814a;
		}
		h2{
			margin-left:1em;
		}
		.wrapper{
			width:80%;
			background-color:#FFFFFF;
			border:1px solid #bfbfbf;
			box-shadow: 10px 10px 8px #888888;
			margin:auto;
			min-height:40%;
			padding-bottom:2em;
		}
		.details{
			margin-left:1em;
		}
		
</style>
</head>
<body>
<!--  <h1>Seeker Page </h1>  -->
<header>
	<h1>Hired.com</h1>
</header>
<nav>
<ul>
<li><a href="${pageContext.request.contextPath}/seeker/appliedJobs">Applied Jobs</a></li>
<li><a href="${pageContext.request.contextPath}/seeker/listJob">Show Posted Jobs</a></li>
<li><a href="${pageContext.request.contextPath}/user/logout">Logout</a></li>
</ul>
</nav>
<div class="main">
<div class="wrapper">
<h2>Welcome, ${sessionScope.jbs.firstname}&nbsp;${sessionScope.jbs.lastname}</h2>
<div class="details">
<h4> Profile Summary</h4>
<p>Email : ${sessionScope.jbs.email}</p>
<p>Experience : ${sessionScope.jbs.exp}</p>
<p>Primary Skills : ${sessionScope.jbs.primarySkill}</p>
</div>
</div>
</div>
</body>
</html>