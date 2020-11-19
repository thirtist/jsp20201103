<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="car" class="chap08.Car"></jsp:useBean>

<%--
<jsp:setProperty property="name" param = "name" name="car"/>
<jsp:setProperty property="speed" param = "speed" name="car"/>
request param의 이름과 property의 이름(메소드이름)이 같다면 param을 생략가능 --%>
<jsp:setProperty property="name" name="car"/>
<jsp:setProperty property="speed" name="car"/>
<!--위에 걸 더 줄여서 아래처럼 할 수 있음=모든프로퍼티와 param이름이 같은걸 넣도록  -->
<jsp:setProperty property="*" name="car"/>

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

<jsp:getProperty property="name" name="car"/>
<jsp:getProperty property="speed" name="car"/>

</body>
</html>