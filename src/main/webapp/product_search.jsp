<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.itwill.shop.product.Review"%>
<%@page import="com.itwill.shop.product.ReviewService"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.itwill.shop.product.ProductService"%>
<%@ page import="com.itwill.shop.product.Product" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	boolean isLogin = false;
	if (session.getAttribute("sMemberId") != null) {
		isLogin = true;
	}
	
	ProductService productService = new ProductService();
	
	//String searchProductName = request.getParameter("searchProductName");
	
	//if(searchProductName == null || searchProductName.equals("")) {
		//productList = productService.selectProductAllByCategory(3);
	//} else {
		//productList = productService.selectProductByProductName(searchProductName);
	//}
	
	ReviewService reviewService = new ReviewService();
	List<Product> productList=(List<Product>)session.getAttribute("sProductList");
%>	

<!DOCTYPE html>
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript">
function add_cart_popup_window(f){
	if (<%=!isLogin%>) {
		alert('로그인 하세요');
		location.href = 'member_login_form.jsp';
	} else {
		var left = Math.ceil(( window.screen.width)/5);
		var top = Math.ceil(( window.screen.height)/3); 
		console.log(left);
		console.log(top);
		var cartWin = window.open("about:blank","cartForm","width=400,height=320,top="+top+",left="+left+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
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


<!-- include_common_top.jsp start-->
<!--include_common_top_menu.jsp  start-->



		

<!-- include_common_top.jsp end-->

			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			




<!--  
<script type="text/javascript">
	function login_message() {
		alert('로그인하세요');
		location.href = 'user_login_form.jsp';
	}
</script>
-->	


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
									<td bgcolor="ffffff" height="22">
									<font size="5">&nbsp;&nbsp;<b>
											search</b></font></td>
								</tr>
							</table>

							<div id="f">
							<br/>
								<!-- 검색어 입력 폼과 버튼(image) 추가 -->
								<!--  
								<form action="product_ipad_list.jsp" method="get" style="text-align: right;">
									<input type="text" name="searchProductName" id="searchProductName" value="">
									<input type="image" src="image/product/product_search_20.png" >
								</form>
								-->
								<!-- 상품리스트 시작 -->
								<table id="product_table" width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="FFFFFF">
									<%
									int product_size = productList.size();
									int product_column_size = 3;
									int product_line_count = 1;
									
									
									for (int i=0; i<productList.size(); i++) {
											Product product = productList.get(i);
									%>
									<!--상품뿌리기 -->
									<%
									 if(i%product_column_size == 0){
									%>
									<tr>
									<%} %>
										<td align="center" width="25%" bgcolor="ffffff"><a href="product_detail.jsp?p_no=<%=product.getPNo()%>"><img width="300px" height="300px" src="image/product/<%=product.getPImage() %>" border="0"></a><br>
												
											<br> <b><font size="4"><%=product.getPName() %></font></b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="1">
												<input type="hidden" name="cart_qty" value="1"><br>
											<font color="#000000" size="3">₩<%=new DecimalFormat("#,##0").format(product.getPPrice()) %>~<br>
											</font>
											
											<%
											List<Review> reviewList = reviewService.findByPNo(product.getPNo());
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
											BigDecimal bd = new BigDecimal(gradeAvg);
											bd = bd.setScale(1, RoundingMode.HALF_UP);
											%>
											<span style="font-size: 16px;">(★ <%=bd %>)</span><br><br>
											
												<img width="120px" height="15px" src="image/product/addtocart.png" style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top">
											</form><br> 
										
										</td>
									<%if(i%product_column_size==3){%>
									</tr>
									<%} %>	
									
								   <!--상품리스트 끝 -->
								   <%}%>	
								   	
								</table>
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