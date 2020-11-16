<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
String sql = "SELECT ename, salary * 12 + NVL(commission, 0) AS sal"
			 + " FROM employee"
			 + " WHERE eno = 7499";

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

//1. JDBC 드라이버 로딩 - 드라이버를 lib폴더에 저장하고 있는지 검사
	Class.forName("oracle.jdbc.driver.OracleDriver");

//2. 데이터베이스 커넥션 구함
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "c##mydbms";
	String pw = "admin";
	con = DriverManager.getConnection(url, id, pw);
	
//3. 쿼리 실행을 위한 Statement 객체 생성
	 stmt = con.createStatement();
//4. quary
     rs = stmt.executeQuery(sql);

int sal = 0;
String ename = "";

//5. 처리
	 if(rs.next()){
		sal = rs.getInt("sal");
		ename =  rs.getString("ename");
	 }

//6. statement close
//7. 연결 close


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

<%= ename + ","+sal%>

</body>
</html>