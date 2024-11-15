<%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="org.eclipse.jdt.internal.compiler.env.IBinaryNestedType"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>

<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("product_list.jsp");
	return;
}
String buyType = request.getParameter("buyType");
if (buyType == null) {
	response.sendRedirect("product_list.jsp");
	return;
}

CartService cartService = new CartService();
MemberService memberService = new MemberService();
ProductService productService = new ProductService();

int tot_price = 0;
int oi_tot_count = 0;
String[] cart_noStr_array = new String[]{};
Order order = new Order();
Member loginUser = memberService.findMember(sMemberId);

if (buyType.equals("cart")) {
	/*
	카트테이블에있는 모든제품을 주문하기
	*/
	List<Cart> cartItemList = new ArrayList<Cart>();
	cartItemList = cartService.getCartItemByMemberId(sMemberId);
	for (Cart cart : cartItemList) {
		order.getOrderItemList().add(new OrderItem(0, cart.getCQty(), 0, cart.getProduct()));
		tot_price += cart.getCQty() * cart.getProduct().getPPrice();
		oi_tot_count += cart.getCQty();
	}
} else if (buyType.equals("cart_select")) {
	/*
	카트보기에서 선택된 제품을 주문하기
	*/
	cart_noStr_array = request.getParameterValues("cart_no");
	if (cart_noStr_array == null) {
		response.sendRedirect("product_list.jsp");
		return;
	}

	for (String cart_noStr : cart_noStr_array) {
		int cart_no = Integer.parseInt(cart_noStr);
		Cart cart = cartService.getCartItemByCartNo(cart_no);
		Product product = cart.getProduct();

		order.getOrderItemList().add(new OrderItem(0, cart.getCQty(), 0, product));
		tot_price += cart.getCQty() * product.getPPrice();
		oi_tot_count += cart.getCQty();

	}

} else if (buyType.equals("direct")) {
	/*
	상품에서에서 직접제품을 주문하기
	*/
	String p_noStr = request.getParameter("p_no");
	String p_qtyStr = request.getParameter("p_qty");
	if (p_noStr == null || p_qtyStr == null) {
		response.sendRedirect("product_list.jsp");
		return;
	}

	Product product = productService.selectByPNo(Integer.parseInt(p_noStr));
	order.getOrderItemList().add(new OrderItem(0, Integer.parseInt(p_qtyStr), 0, product));
	tot_price = order.getOrderItemList().get(0).getOiQty() * order.getOrderItemList().get(0).getProduct().getPPrice();
	oi_tot_count += order.getOrderItemList().get(0).getOiQty();

}
//오더설명 수정!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
String o_desc = order.getOrderItemList().get(0).getProduct().getPName() + "외 " + (oi_tot_count - 1) + " 개";
order.setmId(sMemberId);
order.setOrderPrice(tot_price);
order.setOrderDesc(o_desc);

/**********************세션에 주문데이타담기***************************/
session.setAttribute("order", order);
/*********************************************************************/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/table.css" type="text/css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">
<style type="text/css" media="screen">
/*
form > table tr td{
	border: 0.1px solid black;
}
form > table tr td{
	border: 0.1px solid black;
}
*/
</style>
<script type="text/javascript">
	/*
	 * 주문
	 */
	function order_create_form_submit() {
		if(document.order_create_form.address.value==''){
			alert("배송지를 입력해주세요");
			document.order_create_form.address.focus();
			return;
		}
		document.order_create_form.method = 'POST';
		document.order_create_form.action = 'order_create_action.jsp';
		document.order_create_form.submit();
	}
</script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
    			document.order_create_form.address.value=data.address;
    			
            }
        }).open();
    }
</script>
<script>
// JavaScript 코드
function updateDefaultAddress() {
    var checkbox = document.getElementById("defaultAddress");
    var isDefault = checkbox.checked;

    if (isDefault) {
        // 체크박스가 선택된 경우, 주소 필드 업데이트
        document.getElementById("order_name").value = '<%=loginUser.getMName()%>';
        document.getElementById("order_addr").value = '<%=loginUser.getMAddress()%>';
        document.getElementById("order_phone").value = '<%=loginUser.getMPhone()%>';
        
		} else {
			// 체크박스가 해제된 경우, 필요한 로직 수행
			// 예: 주소 필드 초기화
			document.getElementById("order_name").value = "";
			document.getElementById("order_addr").value = "";
			document.getElementById("order_phone").value = "";
		}
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>

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
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="FFFFFF" height="22"><font size="5"><b>
												주문결제</b></td>
								</tr>
							</table> <!--form-->
							<form id="myTable" name="order_create_form">
								<input type="hidden" name="buyType" value="<%=buyType%>">
								<%
								for (String cart_no : cart_noStr_array) {
								%>
								<input type="hidden" name="cart_no" value="<%=cart_no%>">
								<%
								}
								%>
								<table id="myTable" align=center width=80% border="0"
									cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">
										<font size="2">배송지정보 
									</caption>


									<tr>

										<td width=112 height=26 align=left bgcolor="ffffff" class=t1>&nbsp;&nbsp;기본배송지</td>
										<td width=456 height=26 align=left bgcolor="ffffff" class=t1>
											<input type="checkbox" id="defaultAddress"
											name="defaultAddress" onclick="updateDefaultAddress()">

										</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
									<tr>

										<td width=112 height=26 align=left bgcolor="ffffff" class=t1>&nbsp;&nbsp;받으실
											분</td>
										<td width=456 height=26 align=left bgcolor="ffffff" class=t1>
											<input type="text" id="order_name" name="name"
											style="width: 300px; margin-left: 5px; border-radius: 5px;">

										</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
									<tr>
										<td width=112 height=26 align=left bgcolor="ffffff" class=t1>&nbsp;&nbsp;주소</td>
										<td width=456 height=26 align=left bgcolor="ffffff" class=t1>
											<input type="text" id="order_addr" name="address"
											style="width: 300px; margin-left: 5px; border-radius: 5px;"> <input
											type="button"
											style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기">


										</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
									<tr>
										<td width=112 height=26 align=left bgcolor="ffffff" class=t1>&nbsp;&nbsp;연락처</td>
										<td width=456 height=26 align=left bgcolor="ffffff" class=t1><input
											type="text" id="order_phone" name="phone"
											style="width: 300px; margin-left: 5px; border-radius: 5px;"></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
								</table>
								<br />

								<table id="myTable" align=center width=80% border="0"
									cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">
										<font size="2">주문제품목록 
									</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>상품이미지</td>
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>제품이름</td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1>수량</td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1>가격</td>
										<td width=50 height=25 bgcolor="E6ECDE" align=center class=t1>비고</td>
									</tr>
									<%
									for (OrderItem orderItem : order.getOrderItemList()) {
									%>
									<!-- order item start -->
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='product_detail.jsp?p_no=<%=orderItem.getProduct().getPNo()%>'><img
												width="100px" height="100px"
												src="image/product/<%=orderItem.getProduct().getPImage()%>"
												border="0"></a>
										</td>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='product_detail.jsp?p_no=<%=orderItem.getProduct().getPNo()%>'><%=orderItem.getProduct().getPName()%></a>
										</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=orderItem.getOiQty()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>
											<%=new DecimalFormat("#,###").format(orderItem.getOiQty() * orderItem.getProduct().getPPrice())%>
										</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- cart item end -->
									<%
									}
									%>
									<tr>
										<td width=640 colspan=5 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>총 주문 금액 : <%=new DecimalFormat("#,###").format(order.getOrderPrice())%>
													원
												</font>
											</p>
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a
										href="javascript:order_create_form_submit();" class=m1>결제하기</a>
										&nbsp;&nbsp;<a href=product_list.jsp class=m1>계속 쇼핑하기</a>

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