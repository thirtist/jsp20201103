<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
<form>
	<input type="text" name="id"/> <br />
	<input type="text" name="pw"/> <br />
	<input type="password" name="pw2"/> <br />
	<input type="number" name ="age" value ="10"/> 
	<input type="date" name ="date"/> 
	<input type="submit" value="전송"/>
</form>
<!--input E는 form안에 같이 있어야지 submit타입의 버튼을 누르면 그 안에 것이 함께 서버로 전송됨
전송된 값은 request에 저장되니 뜯어보면 알 수 있음  -->
<%
String val1 = request.getParameter("id");
String val2 = request.getParameter("pw");
String val3 = request.getParameter("pw2");
String val4 = request.getParameter("age");
int val4int = 0;
if (val4 != null)
	{val4int = Integer.parseInt(val4);
	}
/* .getParameter()는 String으로 리턴하니 쓸러면 형변환 해줘야함, 초기값이 null이면 형변환불가라서 if문으로해줌*/
String val5 = request.getParameter("date");
String val6 = request.getParameter("age2");
%>

id : <%= val1 %> <br />
pw : <%= val2 %> <br />
pw2 : <%= val3 %> <br />
age : <%= val4 %> <br />
date : <%= val5 %> <br />
age2 : <%= val6 %> <br />


</body>
</html>