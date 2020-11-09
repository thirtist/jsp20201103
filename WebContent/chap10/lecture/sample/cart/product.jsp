<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
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

<%
String food = request.getParameter("food");
Integer cartSize=0;
if (session.getAttribute("cart") !=null) {
	Map<String, Integer> size = (Map<String, Integer>) session.getAttribute("cart");
	cartSize = size.size();
}

if (food != null) {
	// 세션에 추가
	Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
	if (cart == null) {
		cart = new HashMap<String, Integer>();
		session.setAttribute("cart", cart);
	}
	
	/* if(cart.containsKey(food)) {
		cart.put(food,cart.get(food)+1);
	} else {
		cart.put(food,1);
	} */
	cart.compute(food, (k, v) -> (v == null) ? 1 : v+1);
	cartSize = cart.size();
} 

Map<String, String> prods = new HashMap<>();
prods.put("water", "물");
prods.put("pizza", "피자");
prods.put("burger", "버거");
prods.put("choco", "초코렛");
prods.put("icecream", "아이스크림");
%>
<form action="" method="post" >
<select name="food" id="">

<%
for (Map.Entry<String, String> prod : prods.entrySet()) {
	String selected = "";
	if (prod.getKey().equals(food)) {
		selected = "selected";
	}
%>
	<option value="<%= prod.getKey() %>" <%= selected %>><%= prod.getValue() %></option>
<%
}
%>


<%--
		<option value="water">물</option>
		<option value="pizza">피자</option>
		<option value="burger">버거</option>
		<option value="choco">초코렛</option>
		<option value="icecream">아이스크림</option>
 --%>
</select>
<br/>
<input type="submit" value ="장바구니담기"/>
</form>
총 항목 : <%= cartSize %>
<a href="cart.jsp">장바구니 보기</a>
</body>
</html>