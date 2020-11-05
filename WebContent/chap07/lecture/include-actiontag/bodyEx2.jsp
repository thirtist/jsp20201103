<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
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
<h1>bodyex2</h1>

request 참조 값: <%= System.identityHashCode(request) %>

<br />
<%= request instanceof HttpServletRequest %>
<br />
<%= request instanceof ServletRequestWrapper %>

<hr />

<jsp:include page="navbarEx2.jsp"></jsp:include>
<!--jsp:include는 vsCode로 java로 변환된 파일을 찾아보면
org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbarEx2.jsp", out, false);
에 들어가게 되는데-->
<!-- 여기에 사용되는 request는 같은 bodyEx2와 같은 request를 사용하게 됨 -->
<!--단 System.identityHashCode(request)를 사용해서 참조값을 비교해서 같은 객체인지 확인해보려했으나-->
<!--include actioncode로 들어가는 객체는 ServletRequestWrapper라는 클래스에 감싸여 만들어지므로-->
<!--참조값은 달랐음 (Wrapper를 벗겨서 형변환하면 request의 참조값이 같다는 것이 나옴 -->

</body>
</html>