<%@page import="com.itwill.shop.order.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
  OrderService orderService = new OrderService();
  List<Order> orderList=orderService.orderList("minsub1");
  
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	for(Order order: orderList){
	%>
	<tr>
		<td><%=order %></td>
	</tr>

<% 
	}
%>		
</body>
</html>