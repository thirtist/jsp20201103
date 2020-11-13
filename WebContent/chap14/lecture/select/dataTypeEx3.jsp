<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
String sql = "SELECT * FROM employee WHERE eno = 7521";

String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "c##mydbms";
String password = "admin";

Date hiredate = null;

Class.forName("oracle.jdbc.driver.OracleDriver");

try ( Connection conn = DriverManager.getConnection(url, user, password);
		Statement stmt = conn.createStatement();) {
	
	ResultSet rs = stmt.executeQuery(sql);
	
	if (rs.next()){
		hiredate = rs.getDate("hiredate");
	}
	
} 
 catch (Exception e) {
	 e.printStackTrace();
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

<%=hiredate %>
<!-- 괴도키드 다녀감 ㅎ -->
</body>
</html>