<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/lecture"%>
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
<my:ex2bodyEmpty/>
<hr />
<my:ex2bodyEmpty></my:ex2bodyEmpty>
<hr />
<%-- <my:ex2bodyEmpty> </my:ex2bodyEmpty>
 --%></body>
<hr />
<my:ex2bodyScriptless />
<hr />
<my:ex2bodyScriptless>
	bodycontent
</my:ex2bodyScriptless>
<hr />
<%-- <my:ex2bodyScriptless>
	<%
	out.print("hello");
	%>
</my:ex2bodyScriptless> 스크립트요소(스크립트릿,표현식,선언부는 안됨)--%>

<my:ex2bodyScriptless>
	${param.age +100 }
</my:ex2bodyScriptless>


</html>