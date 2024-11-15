<%@ page import="java.math.RoundingMode"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="com.itwill.shop.product.Review"%>
<%@ page import="com.itwill.shop.product.ReviewService"%>
<%@ page import="com.itwill.shop.product.ProductPageMakerDto"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.itwill.shop.product.ProductService"%>
<%@ page import="com.itwill.shop.product.Product"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean isLogin = false;
if (session.getAttribute("sMemberId") != null) {
	isLogin = true;
}


String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
	pageno = "1";
}

String categoryName = "";
String categoryCode = request.getParameter("categoryCode");

if(categoryCode == null ||categoryCode.equals("")){
	categoryCode = "no";
}

String searchType = request.getParameter("searchType");
if(searchType == null ||searchType.equals("")){
	searchType = "no";
}
String searchKeyword = request.getParameter("searchKeyword");



ProductService productService = new ProductService();
List<Product> productList = null;
ProductPageMakerDto productPage=null;
Product searchProduct = new Product();

if (searchType.equals("no") && !categoryCode.equals("no")) {
	productPage = productService.selectProductAllByCategory(Integer.parseInt(categoryCode), (Integer.parseInt(pageno)));
	
	if (categoryCode.equals("1")) {
		categoryName = "iPhone";
	}
	if (categoryCode.equals("2")) {
		categoryName = "Mac";
	}
	if (categoryCode.equals("3")) {
		categoryName = "iPad";
	}
	if (categoryCode.equals("4")) {
		categoryName = "Watch";
	}
	if (categoryCode.equals("5")) {
		categoryName = "AirPods";
	}
	
} else if (categoryCode.equals("no") && !searchType.equals("no")) {
	if (searchType.equals("1")) {
		searchProduct.setPName(searchKeyword);
	} else if (searchType.equals("2")) {
		searchProduct.setPContent(searchKeyword);
	}
	productPage = productService.selectProductBySearchKeyword(searchProduct, (Integer.parseInt(pageno)));
	categoryName = searchKeyword + " 검색 결과";
	
} else if (categoryCode.equals("no") && searchType.equals("no")) {
	productPage = productService.selectProductAll(Integer.parseInt(pageno));
	categoryName = "ALL";
}

ReviewService reviewService = new ReviewService();




%>

<!DOCTYPE html>
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel="icon" type="image/png" href="../image/icons8-맥-os-32.png">
<script type="text/javascript">
	function add_cart_popup_window(f) {
		if (
<%=!isLogin%>
	) {
			alert('로그인 하세요');
			location.href = 'member_login_form.jsp';
		} else {
			var left = Math.ceil((window.screen.width) / 5);
			var top = Math.ceil((window.screen.height) / 3);
			console.log(left);
			console.log(top);
			var cartWin = window
					.open(
							"about:blank",
							"cartForm",
							"width=400,height=320,top="
									+ top
									+ ",left="
									+ left
									+ ",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
			f.action = 'cart_add_action_popup_window.jsp';
			f.target = 'cartForm';
			f.method = 'POST';
			f.submit();
		}
	}
</script>
<style type="text/css" media="screen">
</style>
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

			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<%-- <jsp:include page="include_common_left.jsp" /> --%>





			<!--  <script type="text/javascript">
	function login_message() {
		alert('로그인하세요');
		location.href = 'member_login_form.jsp';
	}
</script>



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
									<td bgcolor="ffffff" height="22"><font size="4">&nbsp;&nbsp;<b>
												<%=categoryName%></b></font></td>
								</tr>
							</table>

							<div id="f">
								<br />
								<!-- <form action="product_list.jsp" method="get" style="text-align: right;">
    							<input type="text" name="searchKeyword" id="searchKeyword" value="iPhone 16 사전예약 중" 
           							   onfocus="if(this.value=='iPhone 16 사전예약 중') this.value='';" 
           							   onblur="if(this.value=='') this.value='iPhone 16 사전예약 중';" 
           							   style="height: 20px; width: 150px;"> 
    							<input type="hidden" name="searchType" id="searchType" value="1">
    							<input type="image" src="image/product/product_search_20.png" style="margin-left: 5px; vertical-align: middle;">
							</form> -->



								<!-- 상품리스트 시작 -->
								<table id="product_table" width="100%" align="center" border="0"
									cellpadding="10" cellspacing="0" bgcolor="ffffff">
									<%
									productList = productPage.itemList;
									int product_size = productPage.itemList.size();
									int product_column_size = 3;
									double product_line_count = (int) Math.ceil(product_size / 3.0);
									System.out.println(product_line_count);


									for (int i = 0; i < product_line_count; i++) {
									%>
									<!--상품뿌리기 -->

									<tr>
										<%
										for (int j = 0 + i * product_column_size; j < product_column_size * i + product_column_size; j++) {
											Product p = null;
											try {
												p = productList.get(j);
											} catch (Exception e) {
												// e.printStackTrace();
											}
											if (p != null) {
										%>


										<td align="center" width="25%" bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=<%=p.getPNo()%>"><img
												width="300px" height="300px"
												src="image/product/<%=p.getPImage()%>" border="0"></a><br>

											<br> <b><font size="3"><%=p.getPName()%></font></b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="<%=p.getPNo()%>">
												<input type="hidden" name="cart_qty" value="1"><br>
												<font color="#000000" size="2">₩<%=new DecimalFormat("#,##0").format(p.getPPrice())%>~<br>
												</font>

												<% 
												List<Review> reviewList = reviewService.findByPNo(p.getPNo());
												double grade = 0.0;
												double gradeAvg = 0.0;
												for (Review review : reviewList) {

													if (review.getRStar().equals("★☆☆☆☆")) {
														grade += 1;
													} else if (review.getRStar().equals("★★☆☆☆")) {
														grade += 2;
													} else if (review.getRStar().equals("★★★☆☆")) {
														grade += 3;
													} else if (review.getRStar().equals("★★★★☆")) {
														grade += 4;
													} else {
														grade += 5;
													}
												}

												gradeAvg = grade / reviewList.size();
												/* BigDecimal bd = new BigDecimal(gradeAvg);
												bd = bd.setScale(1, RoundingMode.HALF_UP); */
												%>
												
												<span style="font-size: 13px; color: #FBB117;"><%-- (★ <%=bd %>) --%>
												</span><br>
												<br> <img width="120px" height="15px"
													src="image/product/addtocart.png" style="cursor: pointer;"
													onclick="add_cart_popup_window(this.parentElement);"
													align="top">
											</form>
											<br></td>


										<%
										} else {
										%>
										<td align="center" width="25%" bgcolor="ffffff"></td>


										<%
										}
										}
										%>



									</tr>





									<!--상품리스트 끝 -->
									<%}%>

								</table>
								<br>
								<br>
								<!-- 페이지번호... -->

								<table border="0" cellpadding="0" cellspacing="1" width="590">
									<tr>
										<td align="center">
											<%
											if (productPage.productPageMaker.getCurBlock() > 1) {
											%> 
											<a href="./product_list.jsp?pageno=<%=productPage.productPageMaker.getPrevGroupStartPage()%>&categoryCode=<%=categoryCode%>&searchKeyword=<%=searchKeyword%>&searchType=<%=searchType%>">◀◀</a>&nbsp;
											<%
											}
											%> 
											<%
 											if (productPage.productPageMaker.getPrevPage() > 0) {
 										 	%> 
 										 	<a href="./product_list.jsp?pageno=<%=productPage.productPageMaker.getPrevPage()%>&categoryCode=<%=categoryCode%>&searchKeyword=<%=searchKeyword%>&searchType=<%=searchType%>">◀</a>&nbsp;&nbsp;
											<%
											}
											%> 
											<%
 											for (int i = productPage.productPageMaker.getBlockBegin(); i <= productPage.productPageMaker.getBlockEnd(); i++) {
 												if (productPage.productPageMaker.getCurPage() == i) {
 											%> <font color='red'><strong><%=i%></strong></font>&nbsp; <%
 												}else {
 											%> 
 											<a href="./product_list.jsp?pageno=<%=i%>&categoryCode=<%=categoryCode%>&searchKeyword=<%=searchKeyword%>&searchType=<%=searchType%>"><strong><%=i%></strong></a>&nbsp;
											<%
											}
											}
											%> 
											<%
 											if (productPage.productPageMaker.getNextPage() <= productPage.productPageMaker.getTotPage()) {
 											%> 
 											<a href="./product_list.jsp?pageno=<%=productPage.productPageMaker.getNextPage()%>&categoryCode=<%=categoryCode%>&searchKeyword=<%=searchKeyword%>&searchType=<%=searchType%>">▶</a>
											<%
											}
											%> 
											<% if (productPage.productPageMaker.getTotBlock() > productPage.productPageMaker.getCurBlock()) {
 											%> 
 											<a href="./product_list.jsp?pageno=<%=productPage.productPageMaker.getNextGroupStartPage()%>&categoryCode=<%=categoryCode%>&searchKeyword=<%=searchKeyword%>&searchType=<%=searchType%>">▶▶&nbsp;</a>
											<%
											}
											%>

										</td>
									</tr>
								</table>
								<!-- 페이지번호... 끝-->


							</div> <br /></td>
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