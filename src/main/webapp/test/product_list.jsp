<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

	ProductService productService = new ProductService();
	List<Product> productList = productService.selectProductAll();


%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	for(Product product : productList){

%>
<li><%=product %></li>
<% }%>

</body>
</html>