<%@page import="aloginpractice.User"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
String path = "c:/temp/user.txt";
InputStream is = new FileInputStream(path);
ObjectInputStream ois = null;

try {
	ois = new ObjectInputStream(is);
} catch (IOException e) {
	e.printStackTrace();
}

Map<String, User> map = new HashMap<>();


	if( ois != null) {
		Object obj = ois.readObject();
		map = (Map<String, User>) obj;
		ois.close();
	}
	
is.close();
// 여기까지가 map으로 불러온 데이터


String email = request.getParameter("email");
String password = request.getParameter("password");
User user = map.get(email);

 if (user==null || !password.equals(user.getPassword())) {
	 response.sendRedirect("loginJoinS.jsp"+"?code=3");
 } else {
	 session.setAttribute("user", user);
	 response.sendRedirect("main.jsp");
 }

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

</body>
</html>