<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
/*

         1.전체주문삭제
           	- 주문테이블 delete ON DELETE CASCADE
         */
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("order_list_orderitem2.jsp");
	return;
}
OrderService orderService = new OrderService();
orderService.delete(sMemberId);
response.sendRedirect("order_list_orderitem2.jsp");
%>