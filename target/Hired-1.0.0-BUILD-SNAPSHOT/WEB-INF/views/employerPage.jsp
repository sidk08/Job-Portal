<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Employer Page </h1>
<br>
<h2>Organization${sessionScope.em.organization}</h2>
<br>
<h3>Welcome, ${sessionScope.em.username}</h3>
<a href="${pageContext.request.contextPath}/employer/createJob">Create Job</a>&nbsp;|&nbsp;
<a href="${pageContext.request.contextPath}/employer/listJob">List Posted Jobs</a>&nbsp;|&nbsp;
<a href="${pageContext.request.contextPath}/user/logout">Logout</a>&nbsp;|&nbsp;
</body>
</html>