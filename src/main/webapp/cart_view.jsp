<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<%

CartService cartService = new CartService();
List<Cart> cartList = cartService.getCartItemByMemberId(sMemberId);
Collections.sort(cartList, new Comparator<Cart>() {

	@Override
	public int compare(Cart o1, Cart o2) {
		return o2.getCNo() - o1.getCNo();
	}
	
});
%>

<!DOCTYPE html>
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/cart.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/table.css" type="text/css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">

<style type="text/css" media="screen">
</style>
<script type="text/javascript">

	/*
	장바구니 비우기
	 */
	function cart_delete_action() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'cart_delete_action.jsp';
		document.cart_view_form.submit();
	}

	/*

	장바구니 전체 상품 주문
	*/

	function cart_view_form_order_submit() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.buyType.value = 'cart';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	
	/*
	장바구니에서 선택한 상품만 주문
	*/
	function cart_view_form_select_order_submit() {
		let cart_item_checkbox_list = document.getElementsByName("cart_item_checkbox");
		let isChecked = false;
		for (let i = 0; i < cart_item_checkbox_list.length; i++) {
			if (cart_item_checkbox_list.item(i).checked === true) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert('선택한 상품이 없습니다.');
			return;
		}
		document.cart_view_form.buyType.value = 'cart_select';
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	
	/*
	체크박스 선택 시 실행
	*/
	function cart_item_select_count(){
		let cart_item_check_list = document.getElementsByName("cart_item_no_check");
		let cart_item_check_selected_count = 0;
		for (let i = 0; i < cart_item_check_list.length; i++) {
			if (cart_item_check_list.item(i).checked === true) {
				cart_item_check_selected_count++;
			}
		}
		document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
	}
	
	/*
	장바구니 아이템 1개 삭제
	*/
	function cart_delete_item_action(cart_no) {
		if (window.confirm('해당 상품을 장바구니에서 삭제하시겠습니까?')) {
			cart_delete_item_form.method = 'POST';
			cart_delete_item_form.cart_no.value = cart_no;
			cart_delete_item_form.action = 'cart_delete_item_action.jsp';
			cart_delete_item_form.submit();
		}
	}
	
	/*
	장바구니 아이템 수량 수정
	*/
	//getCNo , +, cart_qty_ getCNo
	function cart_update_item_action(cart_no, updown) {
		let cart_qty_input = document.getElementById('cart_qty_' + cart_no);
		document.cart_update_form.cart_no.value = cart_no;
		if (updown == '+') {
			document.cart_update_form.cart_qty.value = parseInt(cart_qty_input.value) + 1;
		} else if (updown == '-') {
			if (parseInt(cart_qty_input.value) > 1) {
				document.cart_update_form.cart_qty.value = parseInt(cart_qty_input.value) - 1;
			} else {
				if (window.confirm('해당 상품을 장바구니에서 삭제하시겠습니까?')) {
					document.cart_update_form.cart_qty.value = 0;
				} else {
					return;
				}
			}
		}
		document.cart_update_form.method = 'POST';
		document.cart_update_form.action = 'cart_update_item_action.jsp';
		document.cart_update_form.submit();
	}
	
	/*
	장바구니 아이템 전체 선택/선택 해제
	*/
	function cart_item_all_select_deselect_checkbox_change() {
		let cart_item_checkbox_list = document.getElementsByName("cart_item_checkbox");
		for (let i = 0; i < cart_item_checkbox_list.length; i++) {
			cart_item_checkbox_list.item(i).checked = document.getElementById('cart_item_all_select_deselect_checkbox').checked;
		}
	}
	
	/*
	장바구니 아이템 한 개 선택, 해제 체크박스 변경 시
	*/
	function cart_item_checkbox_change() {
		let cart_item_checkbox_list = document.getElementsByName("cart_item_checkbox");
		let cart_item_checkbox_selected_count = 0;
		let tot_order_price = 0;
		
		document.cart_view_form.innerHTML = '';
		document.cart_view_form.innerHTML += "<input type='hidden' name='buyType'>";
		for (let i = 0; i < cart_item_checkbox_list.length; i++) {
			if (cart_item_checkbox_list.item(i).checked === true) {
				let cart_no = cart_item_checkbox_list.item(i).value;
				let cart_qty = document.getElementById('cart_qty_' + cart_no).value;
				let cart_product_unit_price = document.getElementById('cart_product_unit_price_' + cart_no).value;
				document.cart_view_form.innerHTML += "<input type='hidden' name='cart_no' value='" + cart_no + "'>";
				tot_order_price += cart_qty * cart_product_unit_price;
				cart_item_checkbox_selected_count++;
			}
		}
		/* 장바구니 총 결제 금액, 수량 변경 */
		document.getElementById('cart_item_select_count').innerHTML = cart_item_checkbox_selected_count;
		document.getElementById('tot_order_price').innerHTML = tot_order_price.toLocaleString();

	}
	
	
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0 onload="cart_item_checkbox_change();">
	<form name="cart_view_form" style="margin: 0">
		<input type="hidden" name="buyType">
	</form>
	<form name="cart_delete_item_form" style="margin: 0">
		<input type="hidden" name="cart_no" value="">
	</form>
	<form name="cart_delete_form" style="margin: 0">
	</form>
	<form name="cart_update_form" style="margin: 0">
		<input type="hidden" name="cart_no" value=""> 
		<input type="hidden" name="cart_qty" value=""> 
	</form>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table>
					<tr>
						<td><br />
							<table style="padding-left: 10px">
								<tr>
									<td height="22" ><h2>
											&nbsp;&nbsp;<b>장바구니</b>
										</h2></td>
								</tr>
							</table>

							<div id='f'>
								<form id = "myTable">
								<table id = "myTable" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=25 height=25 align="center" bgcolor="ffffff" class=t1>
											<input type="checkbox" name="cart_item_all_select_deselect_checkbox"
												   id="cart_item_all_select_deselect_checkbox" checked="checked"
												   onchange="cart_item_all_select_deselect_checkbox_change();cart_item_checkbox_change();"></td>
										<td width=100 height=25 align="center" bgcolor="ffffff"
											class=t1><font>이미지</font></td>
										<td width=210 height=25 align="center" bgcolor="ffffff"
											class=t1><font>상품명</font></td>
										<td width=112 height=25 align="center" bgcolor="ffffff"
											class=t1><font>수량</font></td>
										<td width=146 height=25 align="center" bgcolor="ffffff"
											class=t1><font>가격</font></td>
										<td width=50 height=25 align="center" bgcolor="ffffff"
											class=t1><font>삭제</font></td>
									</tr>
									<!-- cart item start -->
									<%
									int tot_price = 0;
									for (Cart cart : cartList) {

										tot_price += cart.getProduct().getPPrice() * cart.getCQty();

									%>
									<tr>

										<td width=25 height=25 align=center bgcolor="ffffff" class=t1>

											<input type="checkbox" name="cart_item_checkbox"
												   onchange="cart_item_checkbox_change();"
												   value="<%=cart.getCNo()%>" checked="checked">
										</td>
										<td width=100 height=100 align=center bgcolor="ffffff" class=t1>
											<img src='image/product/<%=cart.getProduct().getPImage()%>' width="90" height="90" />
										</td>
										<td width=210 height=40 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=<%=cart.getProduct().getPNo()%>'><%=cart.getProduct().getPName()%></a>
										</td>

										<td width=112 height=40 align=center bgcolor="ffffff" class=t1>

											<input type="button" style = "border-radius: 5px;" value="-" onclick="cart_update_item_action(<%=cart.getCNo()%>,'-');" />
											<input type="text" readonly="readonly" size="2" style="text-align: center; width: 15%; border-radius: 5px;"
												   id="cart_qty_<%=cart.getCNo()%>" name="cart_qty_<%=cart.getCNo()%>" value="<%=cart.getCQty()%>"> 
											<input type="button" style = "border-radius: 5px;"value="+" onclick="cart_update_item_action(<%=cart.getCNo()%>,'+');" />
											<input type="hidden" id="cart_no_<%=cart.getCNo()%>" value="<%=cart.getCNo()%>"> 
											<input type="hidden" id="cart_qty_<%=cart.getCNo()%>" value="<%=cart.getCQty()%>"> 
											<input type="hidden" id="cart_product_unit_price_<%=cart.getCNo()%>" value="<%=cart.getProduct().getPPrice()%>">
										</td>

										<td width=146 height=40 align=center bgcolor="ffffff" class=t1>
											<input type="hidden" id="cart_product_unit_price_<%=cart.getCNo()%>" value="<%=cart.getProduct().getPPrice()%>" /> 
											₩<%=new DecimalFormat("#,##0").format(cart.getProduct().getPPrice() * cart.getCQty())%>
										</td>
										<td width=40 height=40 align=center bgcolor="ffffff" class=t1>
											<a href="javascript:cart_delete_item_action(<%=cart.getCNo()%>);">
												<img src='image/icon-trashcan.png' width="20" height="20" />
											</a>


										</td>
									</tr>
									<%
									}
									%>
									<!-- cart item end -->

									<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												사과상점은 전 상품 무료배송입니다.<br />
												총 주문 금액: ₩<span id="tot_order_price"><%=new DecimalFormat("#,##0").format(tot_price)%></span>
											</p>
										</td>
									</tr>
								</table>
								</form>

							</div> <br />

							<table style="padding-left: 10px" border="0" cellpadding="0"
								cellspacing="1" width="590">
								<tr>

									<td align=center>&nbsp;&nbsp; <a href="product_list.jsp" class=m1>계속 구경하기</a>&nbsp;&nbsp;|
										<a href="javascript:cart_view_form_select_order_submit();" class=m1>
										상품 주문하기 (<span style="font-weight: bold;" id="cart_item_select_count"></span> 
										/ <span style="font-weight: bold;"><%=cartList.size()%></span>)</a>&nbsp;&nbsp;|
										<a href="javascript:cart_delete_action();" class=m1>장바구니 비우기</a>&nbsp;&nbsp; 
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>

</html>