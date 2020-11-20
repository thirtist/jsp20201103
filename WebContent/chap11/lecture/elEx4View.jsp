<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="chap08.member.MemberInfo"></jsp:useBean>
	<jsp:setProperty property="*" name="member"/>
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

${param } <br />

name : ${member.name} <br />
id : ${member.id } <br />
pw : ${member.password } <br />
email : ${member.email } <br />

<hr />
name : ${member["name"]} <br />
id : ${member["id"] } <br />
pw : ${member["password"] } <br />
email : ${member["email"] } <br />


</body>
</html>