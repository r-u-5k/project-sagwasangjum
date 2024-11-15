<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
    response.sendRedirect("product_list.jsp");
    return;
}

String cQtyStr = request.getParameter("cart_qty");
String pNoStr = request.getParameter("p_no");
CartService cartService = new CartService();
cartService.addCart(sMemberId, Integer.parseInt(pNoStr), Integer.parseInt(cQtyStr));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사과상점</title>
<link rel=stylesheet href="css/cart.css" type="text/css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">
<link rel=stylesheet href="css/review.css" type="text/css">


</head>
<body class="cart-popup">
    <div id="cart-popup-container">
        <img id="cart-img" src="../image/icons8-쇼핑-바구니.gif"
            width="60px" height="60px" alt="장바구니이미지">
        <font>상품을 담았습니다.</font>
        <div>
            <div>
                <button class = "btn-5" onclick="window.close();opener.location.reload();">
                    계속 쇼핑
                </button>
                <button class = "btn-5" onclick="window.close();opener.location.href='cart_view.jsp';">
                    장바구니
                </button>
            </div>
        </div>
    </div>
</body>
</html>
