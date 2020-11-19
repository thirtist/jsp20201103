<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="car" class="chap08.Car"></jsp:useBean>
<jsp:setProperty name="car" property="name" value="kia"/>
<jsp:setProperty property="speed" value="90" name="car"/>
<%-- <jsp:setProperty property="stop" value="false" name="car"/>
set메소드가 없어서 이건 안됨 --%>
<%
/* car.setName("kia"); */
%>

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
<%= car.getName() %>

<jsp:getProperty property="name" name="car"/>

</body>
</html>