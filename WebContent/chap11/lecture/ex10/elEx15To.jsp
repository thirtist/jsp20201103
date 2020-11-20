<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
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

${pageScope['pageAttr1']} <br /> <!--얘는 안넘어와서 못빼냄  -->

${requestScope["req Attr1"]} <br />
${requestScope.reqAttr2} <br />
${sessionScope.sesAttr2} <br />
${sessionScope.reqAttr2} <br />
${applicationScope.reqAttr2} <br />
${applicationScope.appAttr1} <br />
${applicationScope["app Attr3"]} <br />

<!--귀찮으면 위에처럼 모두 지정하기  -->

${pageScope['pageAttr1']} <br /> <!--얘는 안넘어와서 못빼냄  -->

${requestScope["req Attr1"]} <br />
${requestScope.reqAttr2} <br />
${sessionScope.sesAttr2} <br />
${sessionScope.reqAttr2} <br />
${applicationScope.reqAttr2} <br />
${applicationScope.appAttr1} <br />
${applicationScope["app Attr3"]} <br />

</body>
</html>