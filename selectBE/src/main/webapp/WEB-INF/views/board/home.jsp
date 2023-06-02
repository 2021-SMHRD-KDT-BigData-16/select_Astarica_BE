<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.AccountsInfo"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<c:forEach var="in" items="${list}">
	<h2>${in.user_id}</h2>
	<h2>${in.user_pw}</h2>
	<h2>${in.user_name}</h2>
	<h2>${in.user_com}</h2>
	<h2>${in.user_job}</h2>
</c:forEach>
</body>
</html>
