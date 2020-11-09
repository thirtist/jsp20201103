<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>


<%
request.setAttribute("attr1", "value1");
session.setAttribute("attr2", "value2");

HttpSession sess = request.getSession();
/* 리퀘스트에서 세션을 꺼내는 방법도 있음 */
/* 서블릿을 배우면 세션이 항상 있는게 아니라서 꺼내서 써야함 */

System.out.print(session == sess);

response.sendRedirect("sessionEx3RedirectTarget.jsp");
%>