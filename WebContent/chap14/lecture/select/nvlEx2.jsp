<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
class Emp {
	private String ename;
	private int sal;
	
	public void setEname(String ename){
		this.ename = ename;
	}
	public void setSal(int sal){
		this.sal = sal;
	}
	public String getEname() {
		return ename;
	}
	public int getSal(){
		return sal;
	}
}
String sql = "SELECT ename, salary*12+NVL(commission, 0)"
			+ " FROM employee";
List<Emp> list = new ArrayList<>();

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
	
	while(rs.next()){
		Emp emp = new Emp();
		emp.setEname(rs.getString("ename"));
		emp.setSal(rs.getInt(2));
		list.add(emp);
	}
	
//6,7 닫기
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
<h1>이름 / 연봉</h1>
<ul>
<%
for (Emp e : list){	
%>
	<li><%= e.getEname() %> : <%= e.getSal() %></li>
<%
}
%>
</ul>

</body>
</html>