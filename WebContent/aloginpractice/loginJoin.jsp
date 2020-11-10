<%@page import="java.io.IOException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="aloginpractice.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
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
	
	
	if(email !=null && password !=null && nickname !=null) {
		
		if(map.containsKey(email)) {
			//이미 이메일이 있는 경우
			response.sendRedirect("loginJoinS.jsp"+"?code=1");
		} else {
			//이메일 중복이 없는 경우
			User user = new User(email, password, nickname);
			map.put(email, user);
			
			OutputStream os = new FileOutputStream(path);
			ObjectOutputStream oos= new ObjectOutputStream(os);
			
			oos.writeObject(map);

			oos.flush();
			oos.close();
			os.close();
			
			response.sendRedirect("loginJoinS.jsp"+"?code=2");
		}
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
<title>회원가입 페이지</title>
</head>
<body>

<h1>회원가입</h1>

<form action="loginJoin.jsp" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name ="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name ="password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Nickname</label>
    <input name ="nickname" class="form-control" id="exampleInputPassword1">
  </div>

  <button type="submit" class="btn btn-primary">가입하기</button>
</form>

</body>
</html>