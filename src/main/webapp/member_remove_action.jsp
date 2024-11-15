<%@page import="com.itwill.shop.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("member_main.jsp");
	return;	
}
	//계정 삭제
	MemberService memberService=new MemberService();
	int removeRowCount=memberService.remove(sMemberId);
	//로그아웃 jsp로 이동
	response.sendRedirect("member_logout_action.jsp");
%>