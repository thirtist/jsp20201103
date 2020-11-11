<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
if (request.getParameter("code").equals("1")){
%>
	<script>alert('삭제 되었습니다.');
	location.href="post.jsp";
	</script>