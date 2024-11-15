<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int cart_item_count = 0;
String sMemberId = (String) session.getAttribute("sMemberId");
if (sMemberId != null) {
	CartService cartService = new CartService();
	cart_item_count = cartService.getCartItemByMemberId(sMemberId).size();
}
%>



<div id="menu">
	<ul>
		<%
		if (sMemberId == null) {
		%>
		<li id="mypage" title="나의페이지"><a href="member_login_form.jsp"></a></li>
		<li id="cart" title="장바구니"><a href="member_login_form.jsp"
			title="장바구니"></a></li>
		<li><a href="board_list.jsp">고객지원</a></li>
		<li class="join"><a href="member_write_form_popup.jsp"
			class="black">회원가입
			
		</a></li>
		<li><a href="member_login_form.jsp">로그인</a></li>
		<%
		} else {
		%>
		<li id="mypage" title="나의페이지"><a href="member_view.jsp"></a></li>
		<%if(cart_item_count==0) { %>
		<li id="cart" title="장바구니"><a href="cart_view.jsp"></a></li>
		<li><a href="board_list.jsp">고객지원</a></li>
		<li><a href="order_list_orderitem2.jsp">주문조회</a></li>
		<li><a href="member_logout_action.jsp">로그아웃</a></li>
		<%}else{ %>
		<li id="cart2" title="장바구니"><a href="cart_view.jsp"></a></li>
		<li><a href="board_list.jsp">고객지원</a></li>
		<li><a href="order_list_orderitem2.jsp">주문조회</a></li>
		<li><a href="member_logout_action.jsp">로그아웃</a></li>
		<%} %>
		<%
		}
		%>
		<li id="logo"><a href="shop_main.jsp"></a></li>
		<%
		if (request.getRequestURI().endsWith("shop_main.jsp")) {
		%>
		<li id="mainlogo"><a href="shop_main.jsp"></a></li>
		<%
		}
		%>
	</ul>
</div>
<!-- 
<div class="top-menu">
    <div class="fright">
        <ul>

            상단 마이페이지 메뉴
            <li class="top-shop"><a href="/myshop/index.html">마이쇼핑</a>
                상단 마이페이지 링크수정
                <div class="top-shop-sub">
                    <a href="/board/consult/list.html">- 1:1문의</a>
                </div>
            </li>

            <li class="last"><a href="/order/basket.html">장바구니</a></li>
        </ul>
    </div>
    상단 메뉴영역02 : 끝
</div> -->