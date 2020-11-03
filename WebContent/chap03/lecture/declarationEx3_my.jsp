<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%!Set<Integer> genLotto() {
		Set<Integer> lotto = new TreeSet<>();

		while (lotto.size() < 6) {
			lotto.add((int) (Math.random() * 45 + 1));
		}
		return lotto;
	}%>

<%!
String colorClass(int num) {
	return "lotto-color" + (num / 10) * 10;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>
.lotto-ball {
	margin: 10px;
	border: 5px solid black;
	border-radius: 50%;
	width: 100px;
	height: 100px;
	font-size: 30px;
	font-weight: 900;
	text-align: center;
	line-height: 100px;
}

.lotto-color0 {
	color: white;
	background-color: blue;
}

.lotto-color10 {
	color: red;
	background-color: red;
}

.lotto-color20 {
	color: black;
	background-color: green;
}

.lotto-color30 {
	color: white;
	background-color: purple;
}

.lotto-color40 {
	color: black;
	background-color: gold;
}
</style>

</head>
<body>
	<%
		Set<Integer> lotto = genLotto();
	%>
	
	<!-- 추가 -->
	<%
		Integer[] arr = new Integer[lotto.size()];
		lotto.toArray(arr);
		Arrays.sort(arr);
		//배열로 넣은다음에 Arrays.sort()함수로 정렬시켰음
		//그런데 Set에도 HashSet말고 TreeSet이란게 있어서 뽑을 때 정렬된 순서대로 뽑는게 있었음
		
	%>
	
	

	<%
		for (int num : lotto) {
	%>
	<div class="lotto-ball <%= colorClass(num) %>">
		<%=num%>
	</div>
	<%
		}
	%>



</body>
</html>