<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
java.util.Set<Integer> lotto = new java.util.HashSet<>();

while (lotto.size() < 6) {
	int rand = (int) (Math.random() * 45 +1);
	lotto.add(rand);
}
%>

<ul>
<%

for (Integer lot : lotto){
%>
	
<li><%=lot%></li>

<% }
%>
</ul>

<!--람다식으로  -->

<ul>
<%
final javax.servlet.jsp.JspWriter fOut = out;
//Integer lot;
lotto.forEach(lot ->  {
	try {
		fOut.print("<li>");
		fOut.print(lot);
		fOut.print("</li>");
	} catch (Exception e) {
		e.printStackTrace();
	}
});
%>

<%
final JspWriter out2 = out;
lotto.forEach(lot -> {
	try{
		out2.print("<li>" + lot + "</li>");
	} catch(Exception e) {
		e.printStackTrace();
	}
});

%>

</ul>
<!-- 괴도키드 왔따감 // 다음에는 꼭 잡고 말테다 -->



</body>
</html>