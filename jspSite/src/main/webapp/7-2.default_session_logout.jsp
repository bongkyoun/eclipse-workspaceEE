<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/********로그인 한 회원만 볼 수 있는 페이지************/
	String loginId = (String)session.getAttribute("loginId");
	if(loginId == null) {
	response.sendRedirect("7-2.default_session_login_form.jsp");
	return;
}
%>

<%
	/*
	세선객체 무효화
	*/
	session.invalidate();
	response.sendRedirect("7-2.default_session_login_form.jsp");

%>