<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
pageContext.setAttribute("pageAttr1", "pageValue1");

request.setAttribute("req Attr1", "req Value1");
request.setAttribute("reqAttr2", "req Value");

session.setAttribute("sesAttr2", "sesAttr2");
session.setAttribute("reqAttr2", "ses Value2");

application.setAttribute("reqAttr2", "app value2");
application.setAttribute("appAttr1", "app value1");
application.setAttribute("app Attr3", "app value3");



%>

<jsp:forward page="elEx15To.jsp"></jsp:forward>