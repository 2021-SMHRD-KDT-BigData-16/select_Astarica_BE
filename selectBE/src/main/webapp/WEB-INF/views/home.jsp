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
 
<c:forEach var="in" items="${csv}">
<h2>${in.imagePath}</h2> 	
	<h2>${in.imageWidth}</h2>
	<h2>${in.imageHeight}</h2>
	<h2>${in.Shape_num}</h2>
	<h2>${in.label}</h2>
	<h2>${in.point1_x}</h2>
	<h2>${in.point1_y}</h2>
	<h2>${in.point2_x}</h2>
	<h2>${in.point2_y}</h2>
	<h2>${in.ratio}</h2>
	
</c:forEach>
</body>
</html>
