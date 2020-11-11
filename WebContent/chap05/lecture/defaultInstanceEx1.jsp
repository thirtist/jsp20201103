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
request(HttpServletRequest) : <%= request %> <br/>
response(HttpServletResponse) : <%= response %> <br/>
session(HttpSession) : <%= session %> <br/>
out(JspWriter) : <%= out %> <br/>

pageContext(PageContext) : <%= pageContext %> <br/>
application(ServletContext) : <%= application %> <br/>
<!-- 아래 두개는 거의 사용안함 -->
config(ServletConfig) : <%= config %> <br/>
page(Object) : <%= page %> <br/>

<!-- 이건 6장내용인데 생략도가능 -->
exception(Throwable) : <br/>
</body>
</html>