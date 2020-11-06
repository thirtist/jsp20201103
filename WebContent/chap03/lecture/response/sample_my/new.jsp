<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="chap03.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

String path = "C:/temp/users.text";
OutputStream os = new FileOutputStream(path);
ObjectOutputStream oos = new ObjectOutputStream(os);


if(null != request.getParameter("email") &&
	null != request.getParameter("password") &&
	null != request.getParameter("nickname"))
{       MyUser myuser = new MyUser(
		request.getParameter("email"),
		request.getParameter("password"),
		request.getParameter("nickname")

);
	oos.writeObject(myuser);
	response.sendRedirect("login.jsp?code=2");
}

oos.flush();
oos.close();
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

<jsp:include page="navbar.jsp"></jsp:include>

<form action="new.jsp">
	<div class="form-group">
		<h1>회원가입</h1>
	</div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="" name="password"class="form-control" id="exampleInputPassword1">
  </div>
  <div class="form-group">
    <label for="">Nickname</label>
    <input type="" name="nickname"class="form-control">
  </div>

  <button type="submit" class="btn btn-primary">가입하기</button>
</form>

</body>
</html>