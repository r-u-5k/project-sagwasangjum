<%@page import="com.itwill.shop.order.OrderListPageMakerDto"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>

<%

String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
    pageno = "1";
}

OrderListPageMakerDto orderListPage = new OrderService().findOrderList(Integer.parseInt(pageno),sMemberId);

//System.out.println(orderListPage.itemList);


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
</style>
<script type="text/javascript">
	function order_delete_all_action() {
		document.order_delete_all_form.action = 'order_delete_all_action.jsp';
		document.order_delete_all_form.method = 'POST';
		document.order_delete_all_form.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="order_delete_all_form" style="margin: 0"></form>
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
												주문 목록</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table id="myTable" align=center width=80% border="0"
									cellpadding="0" cellspacing="1">
									<!-- order start -->
									<%
										for(Order order : orderListPage.itemList){
										List<OrderItem> orderItemList = order.getOrderItemList();
										
									%>
									<tr>
										<td colspan="6" height=24 align=left bgcolor="E6ECDE" class=t1>
											<span style="font-size: 13pt; font-style: bold;">&nbsp;<%=order.getOrderDate().toLocaleString().substring(0, 11)%></span>
											<span style="font-size: 10pt">주문번호 <%=order.getOrderNo()%></span>
											<a href='order_detail.jsp?o_no=<%=order.getOrderNo()%>'
											style="font-size: 10pt">상세보기</a>
										</td>
									</tr>
									<tr>
										<td colspan="6" height=4 align=left class=t1></td>
									</tr>
									<tr>
										<td width="5%"></td>
										<td width="95%" colspan="8" bgcolor="ffffff" class=t1>
											<!--  -->
											<table align="left" border="0" cellspacing="1"
												bgcolor="EEEEEE">
												<tr>
													<%
													int orderItemSize = orderItemList.size();
													int remainSize = 8-orderItemSize;
													for (int j = 0; j < orderItemSize; j++) {
														OrderItem orderItem = orderItemList.get(j);
														Product product = orderItem.getProduct();
														if(j>=8){%>
															<td align="center" style="padding: 0px; width: 55px"
																	bgcolor="ffffff">
																	<a href='order_detail.jsp?o_no=<%=order.getOrderNo()%>'
											style="font-size: 15pt">...</a></td>
															<% break;
														}
													%> 
													<!--상품시작 -->
													<td align="center" style="padding: 0px; width: 55px"
														bgcolor="ffffff"><a style="padding: 0px"
														href="product_detail.jsp?p_no=<%=product.getPNo()%>&pageno=<%=orderListPage.orderPageMaker.getCurPage()%>"><img
															width="80px" height="80px"
															src="image/product/<%=product.getPImage()%>" border="0"
															style="padding-top: 10px"></a> <br> <span
														style="font-size: 8pt"><b><%=product.getPName()%></b>
															<br> <%=new DecimalFormat("#,###").format(orderItem.getOiQty() * product.getPPrice())%>
															<%=orderItem.getOiQty()%>개</span></td>
													<!--상품 끝 -->
													<%
													}
													%>
													<%
													for (int j = 0; j < remainSize; j++) {
														
													%>
													<!--상품시작 -->
													<td align="center" style="padding: 0px; width: 55px"
														bgcolor="ffffff"></td>
													<!--상품 끝 -->
													<%
													}
													%>

												</tr>
											</table>
										</td>
									<tr>
										<td colspan="5" width=145 height=10 align=center
											bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- order end -->
									<%
									}
									%>
									<!-- order end -->
								</table>
							</form> <br />
							 <table border="0" cellpadding="0" cellspacing="1" width="590">
                                <tr>
                                    <td align="center">
                                        <%
                                        if (orderListPage.orderPageMaker.getCurBlock() > 1) {
                                        %>
                                        <a href="./order_list_orderitem2.jsp?pageno=<%=orderListPage.orderPageMaker.getPrevGroupStartPage()%>">◀◀</a>&nbsp;
                                        <%
                                        }
                                        %>
                                        <%
                                        if (orderListPage.orderPageMaker.getPrevPage() > 0) {
                                        %>
                                        <a href="./order_list_orderitem2.jsp?pageno=<%=orderListPage.orderPageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
                                        <%
                                        }
                                        %>
                                        <%
                                        for (int i = orderListPage.orderPageMaker.getBlockBegin(); i <= orderListPage.orderPageMaker.getBlockEnd(); i++) {
                                            if (orderListPage.orderPageMaker.getCurPage() == i) {
                                        %>
                                        <font color='red'><strong><%=i%></strong></font>&nbsp;
                                        <%
                                            } else {
                                        %>
                                        <a href="./order_list_orderitem2.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
                                        <%
                                            }
                                        }
                                        %>
                                        <%
                                        if (orderListPage.orderPageMaker.getNextPage() <= orderListPage.orderPageMaker.getTotPage()) {
                                        %>
                                        <a href="./order_list_orderitem2.jsp?pageno=<%=orderListPage.orderPageMaker.getNextPage()%>">▶</a>
                                        <%
                                        }
                                        %>
                                        <%
                                        if (orderListPage.orderPageMaker.getTotBlock() > orderListPage.orderPageMaker.getCurBlock()) {
                                        %>
                                        <a href="./order_list_orderitem2.jsp?pageno=<%=orderListPage.orderPageMaker.getNextGroupStartPage()%>">▶▶&nbsp;</a>
                                        <%
                                        }
                                        %>
                                    </td>
                                </tr>
                            </table>
							
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a href=product_list.jsp
										class=m1>계속 구경하기</a> <a
										href='javascript:order_delete_all_action();' class=m1>주문전체삭제</a>
									</td>

								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<div id="content">

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