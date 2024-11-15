
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
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
<!-- include_common_top.jsp start-->
<!--include_common_top_menu.jsp  start-->

<jsp:include page="include_common_top_menu.jsp" />

<div id="menu">
	<ul>
		<li id="menuList"><div style="width: 300px"></div></li>
		<li id="menuList"><a href="product_list.jsp">ALL</a></li>
		<li id="menuList"><a href="product_list.jsp?categoryCode=1">iPhone</a></li>
		<li id="menuList"><a href="product_list.jsp?categoryCode=2">Mac</a></li>
		<li id="menuList"><a href="product_list.jsp?categoryCode=3">iPad</a></li>
		<li id="menuList"><a href="product_list.jsp?categoryCode=4">Watch</a></li>
		<li id="menuList"><a href="product_list.jsp?categoryCode=5">AirPods</a></li>
		<li id="menuList"><div style="width: 100px"></div></li>
		<li id="menuList2">
			<form name="searchForm" action="product_list.jsp" method="get"

    style="text-align: right; display: flex; align-items: center;">
    <input type="text" name="searchKeyword" id="searchKeyword" value="iPhone 16 사전예약 중"
        onfocus="clearDefaultText();" onblur="setDefaultText();" style="height: 20px; width: 150px; border-radius: 5px;"> &nbsp;
    <input type="hidden" name="searchType" id="searchType" value="1">
    <img src="image/product/product_search_20.png" onclick="validateSearch();" style="cursor: pointer;">
</form>

<script>
    function clearDefaultText() {
        var searchInput = document.getElementById('searchKeyword');
        if (searchInput.value === 'iPhone 16 사전예약 중') {
            searchInput.value = '';
        }
    }

    function setDefaultText() {
        var searchInput = document.getElementById('searchKeyword');
        if (searchInput.value === '') {
            searchInput.value = 'iPhone 16 사전예약 중';
        }
    }

    function validateSearch() {
        var searchInput = document.getElementById('searchKeyword');
        if (searchInput.value === 'iPhone 16 사전예약 중') {
            searchInput.value = '';
        }
        
        document.forms['searchForm'].submit();
    }
</script>
		</li>
	

	</ul>
</div>

<!--include_common_top_menu.jsp  end-->
<h1>
	<a href=""></a>
</h1>
<!-- include_common_top.jsp end-->
<!-- include_common_top.jsp end-->
<!-- include_common_top.jsp end-->