<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%--
각 영역의 attribute를 <name, object>쌍으로 가지고 있는 map
pageScope
requestScope
sessionScope
applicationScope
 --%>

<%


pageContext.setAttribute("myAttr1", "my value1!!!!!");
pageContext.setAttribute("my attr1", "my value1");
pageContext.setAttribute("myAttr2", "my value2");

request.setAttribute("myAttr1", "request value1!!!!!");
request.setAttribute("my attr1", "request value1");


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

<%-- ${my attr1 } key가 띄어쓰기 되어있어서 바로 못쓰고 pageScope에서 꺼내서 이용--%>
${myAttr1}
${pageScope["my attr1"]}
${myAttr2}
${requestScope.myAttr2}

</body>
</html>