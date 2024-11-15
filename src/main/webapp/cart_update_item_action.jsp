<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("product_list.jsp");
	return;
}

String cNoStr = request.getParameter("cart_no");
String cQtyStr = request.getParameter("cart_qty");
CartService cartService = new CartService();
if (cQtyStr.equals("0")) {
	cartService.deleteCartItemByCartNo(Integer.parseInt(cNoStr));
} else {
	cartService.updateCart(Integer.parseInt(cNoStr), Integer.parseInt(cQtyStr));
}
String referer = request.getHeader("referer");
response.sendRedirect(referer);

%>