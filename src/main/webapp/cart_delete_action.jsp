<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("product_list.jsp");
	return;
}

CartService cartService = new CartService();
cartService.deleteCartItemByMemberId(sMemberId);
String referer = request.getHeader("referer");
response.sendRedirect(referer);
%>