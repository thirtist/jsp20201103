<%@page import="chap09.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

//로그인 성공 조건
String id = request.getParameter("id");
String pw = request.getParameter("pw");

boolean login = false;
if (id != null && pw !=null && id.equals(pw)){
	login = true;
}
// //


//로그인 성공 조건에 따른 작성

Cookies cookies = new Cookies(request); //커스텀 클래스를 활용
//form action으로 넘어왔기 때문에(요청했으니) request객체에 쿠키데이터가 있음
if (login) {
	// 로그인 성공 시
	
	// 세션에 유저정보 속성(attribute) 추가
	session.setAttribute("user", id);

	// JSESSIONID 쿠키(기본쿠키)를 얻고, path, httponly setting
	// 쿠키를 최상위 폴더로 설정하여 모든 페이지에 로그인페이지로 보이게끔
	Cookie cookie = cookies.getCookie("JSESSIONID");
	cookie.setPath(request.getContextPath());
	cookie.setHttpOnly(true);
	
	// rememberme 체크할 경우 세션을 유지하도록//checkbox기본value값="on"
	String remember = request.getParameter("remember");
	if (remember !=null && remember.equals("on")) {
		cookie.setMaxAge(24*60*60); // 쿠키유지시간 설정 후
		response.addCookie(cookie); // response에 수정함
		session.setMaxInactiveInterval(24*60*60); //세션도 유지시간 설정
	} else {
		cookie.setMaxAge(-1);  //체크 안했으면 브라우저 끄면 쿠키사라지게끔(-1)
	    response.addCookie(cookie); // response에 수정함
	    session.setMaxInactiveInterval(30*60); //세션도 유지시간 설정(브라우저안꺼도 일정시간후로그아웃)
	}
	
	//마지막으로 로그인 성공페이지 main.jsp로 redirection
	//세션정보와 쿠키정보를 가지고 가기 때문에request는 날아가도 로그인이 유지됨
	response.sendRedirect("main.jsp");
	
} else {
	//로그인 실패 : loginForm.jsp로 redirection
	//쿠키path를 상위로 설정 안해줬기 때문에 다른쪽으로 가도 쿠키유지가안됨
	//세션에도 response에서 정보를 받아서 안옮겼기 때문에 아무 정보가 없음
	response.sendRedirect("loginForm.jsp");
}

%>