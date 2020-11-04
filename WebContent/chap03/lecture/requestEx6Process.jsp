<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
</head>
<body>
	<%
		Set<Integer> lotto = new HashSet<>();
	while (lotto.size() < 6) {
		lotto.add((int) (Math.random() * 45 + 1));
	}
	
	out.print("당첨번호:");
	out.print(lotto);
	out.print("<br>");
	%>
	
	<%
		String[] getSix = request.getParameterValues("num");
		
		List<Integer> six = new ArrayList<>();
		Integer toInt = 0;
		for(String str : getSix) {
			toInt = Integer.valueOf(str.substring(1));
			six.add(toInt);
		}
		
		
		 int count = 0;
		/*for(Integer lotto2 : lotto){
			for(Integer six2 : six){
				if(lotto2.equals(six2)){
					count++;
				}
			}
		} */
		
		//(선생님) Set의 메소드중에 값이 있는지 비교하는 .contains()를 사용
		//찾아보니 Collection에 포함되어 있는 메소드여서 List도 사용가능함
			for(Integer six2 : six){
				if(lotto.contains(six2)){
					count++;
				}
			}
		
	%>
	<% 
		out.print("선택한 번호 : [");
	for(int i=0; i<six.size(); i++){
		out.print(six.get(i));
		if(i != (int)six.size()-1) {
			out.print(",&nbsp");
		} else {
			out.print("]");
		}
	}
		out.print("<br>");
	
	%>
	
	<% switch (count) {
		
		case 0 :
			out.print("0개 맞았습니다 꽝입니다");
			break;
		case 1 :
			out.print("1개 맞았습니다 꽝입니다");
			break;
		case 2 :
			out.print("2개 맞았습니다 꽝입니다");
			break;
		case 3 :
			out.print("3개 맞았습니다 5000원 당첨!");
			break;
		case 4 :
			out.print("4개 맞았습니다 5만원당첨!");
			break;
		case 5 :
			out.print("5개 맞았습니다 100만원당첨!");
			break;
		case 6 :
			out.print("6개 맞았습니다 12억 당첨!");
			break;
		
	}
	%>
	
	<a href="requestEx6Form.jsp" class="btn btn-secondary">돌아가기</a>
	
	
</body>
</html>