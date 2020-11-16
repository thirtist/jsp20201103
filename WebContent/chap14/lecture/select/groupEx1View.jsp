<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
String job = request.getParameter("job");
String sql = "SELECT max(salary), min(salary), avg(salary)"
			+ ", sum(salary) " + "FROM employee "
			+ "WHERE job = '"+job+"'";


//1.클래스 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
//2.커넥션
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "c##mydbms";
	String password = "admin";
	Connection con = DriverManager.getConnection(url, user, password);
//3. statement
	Statement stmt = con.createStatement();

//4. sql실행
	ResultSet rs = stmt.executeQuery(sql);

//5 활용
	int max = 0;
	int min = 0;
	Double avg = 0.0;
	int sum = 0;

	if(rs.next()){
		max = rs.getInt("max(salary)");
		min = rs.getInt("min(salary)");
		avg = rs.getDouble("avg(salary)");
		sum = rs.getInt("sum(salary)");
	}

stmt.close();
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
<h1>최대 : <%= max %></h1>
<h1>최소 : <%= min %></h1>
<h1>평균 : <%= avg %></h1>
<h1>합계 : <%= sum %></h1>
</body>
</html>