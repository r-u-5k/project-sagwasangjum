<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sMemberId = "guard";
CartService cartService = new CartService();
List<Cart> cartList = cartService.getCartItemByMemberId(sMemberId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ol>
<% for (Cart cart : cartList) { %>
	<li><%=cart %>
<%} %>
</ol>

	
</body>
</html>