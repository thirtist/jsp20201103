<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	//1. JDBC 드라이버 로딩 - 드라이버를 lib폴더에 저장하고 있는지 검사
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//2. 데이터베이스 커넥션 구함
		/* con = DriverManager.getConnection(url, id, pw); */
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "c##mydbms";
	String pw = "admin";
	Connection con = DriverManager.getConnection(url, id, pw);
	
	//3. 쿼리 실행을 위한 Statement 객체 생성
	Statement stmt = con.createStatement();
	
	//4. 쿼리 실행
	
	String dno = request.getParameter("dno");	
	if (dno == null || dno.isEmpty()) {
		dno = "0";
	}
	
	String sql = "SELECT loc FROM department WHERE dno =" + dno;
	ResultSet rs = stmt.executeQuery(sql);
	
	//5. 쿼리 실행 결과 사용
	String loc = "없음";
	if (rs.next()){
		loc = rs.getString("loc");
	}
	
	//6. Statement 종료
	stmt.close();	
	//7. 데이터베이스 커넥션 종료
	con.close();
	
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
<h1><%= loc %></h1>
</body>
</html>