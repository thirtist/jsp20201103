<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
if (request.getParameter("code").equals("1")){
%>
	<script>alert('이메일이 중복 됩니다.');
	location.href="loginJoin.jsp";
	</script>
	
<%
} else if (request.getParameter("code").equals("2")) {
	%>
	<script>alert('회원가입 성공');
	location.href="loginForm.jsp";
	</script>
	<%
} else if (request.getParameter("code").equals("3")) {
	%>
	<script>alert('아이디 또는 패스워드가 다릅니다');
	location.href="loginForm.jsp";
	</script>
	<%
}
%>