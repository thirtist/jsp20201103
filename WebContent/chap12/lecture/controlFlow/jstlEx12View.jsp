<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<c:if test="${not empty param.dark}" var="dark" scope="session">

	<div style="background-color: black; color:white;">
	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum facere consequatur nihil deserunt excepturi ducimus iure qui officiis illo neque officia magnam numquam rem quia aspernatur eveniet ipsa. Facere natus!
	</div>
</c:if>

<c:if test="${not dark}">

	<div style="background-color: white; color:black;">
	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum facere consequatur nihil deserunt excepturi ducimus iure qui officiis illo neque officia magnam numquam rem quia aspernatur eveniet ipsa. Facere natus!
	</div>
</c:if>

</body>
</html>