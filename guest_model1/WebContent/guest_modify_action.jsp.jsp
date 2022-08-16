<%@page import="com.itwill.guest.GuestService"%>
<%@page import="com.itwill.guest.Guest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("guest_main.jsp");
	return;
}

String guest_noStr=request.getParameter("guest_no");
String guest_name=request.getParameter("guest_name");
String guest_email=request.getParameter("guest_email");
String guest_homepage=request.getParameter("guest_homepage");
String guest_title=request.getParameter("guest_title");
String guest_content=request.getParameter("guest_content");
Guest guest=new Guest(Integer.parseInt(guest_noStr),guest_name,null,
						guest_email,guest_homepage,
						guest_title,guest_content);

GuestService guestService = new GuestService();
int rowCount = guestService.updateGuest(guest);
response.sendRedirect("guest_view.jsp?guest_no="+guest_noStr);
%>