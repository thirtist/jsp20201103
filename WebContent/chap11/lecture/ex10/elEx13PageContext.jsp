<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
<%=pageContext%> <br />
${pageContext.request } <br />
${pageContext.session } <br />
${pageContext.servletContext } <br />
${pageContext.response } <br />
${pageContext.servletConfig } <br />

<hr />
<%= request.getContextPath() %> <br />
${pageContext.request.contextPath } <br />
${pageContext.request.cookies[0].name } <br />
${pageContext.request.cookies[0].value } <br />


<!--이전에 스크립트릿(자바)에서 pageContext에서 request를 얻어서 contextPath를 얻는 법 -->
<%
HttpServletRequest request2 = (HttpServletRequest) pageContext.getRequest();
request2.getContextPath();
%>
<!--EL에서 pageContext에서 request를 얻어서 contextPath를 얻는 법(출력까지)  -->
${pageContext.request.contextPath}



</body>
</html>