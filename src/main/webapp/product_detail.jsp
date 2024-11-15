<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ReviewService"%>
<%@page import="com.itwill.shop.product.Review"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String p_noStr = request.getParameter("p_no");
if (p_noStr == null || p_noStr.equals("")) {
	response.sendRedirect("product_list.jsp");
	return;
}
boolean isLogin = false;
if (session.getAttribute("sMemberId") != null) {
	isLogin = true;
}

ProductService productService = new ProductService();
Product product = productService.selectByPNo(Integer.parseInt(p_noStr));
if (product == null) {
	out.println("<script>");
	out.println("alert('매진된상품입니다.');");
	out.println("location.href='product_list.jsp';");
	out.println("</script>");
	return;
}

ReviewService reviewService = new ReviewService();
List<Review> reviewList = reviewService.findByPNo(Integer.parseInt(p_noStr));
int grade = 0;
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
gradeAvg = (double) grade / reviewList.size();
DecimalFormat decimalFormat = new DecimalFormat("#.#");
gradeAvg = Double.parseDouble(decimalFormat.format(gradeAvg));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/table.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/jquery-picZoomer.css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style type="text/css">
.text-info {
	text-align: left;
	line-height: 1.5;
}
</style>

<style type="text/css">
.text-info p {
	text-align: left;
	margin-bottom: 2px;
}
</style>

<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function add_cart() {
		if (
<%=!isLogin%>
	) {
			alert('로그인 하세요');
			location.href = 'member_login_form.jsp';
			return false;
		}
		return true;
	}
	function add_cart_popup_window() {
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
							"width=400,height=300,top="
									+ top
									+ ",left="
									+ 0
									+ ",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
			document.add_cart_form.action = 'cart_add_action_popup_window.jsp';
			document.add_cart_form.target = 'cartForm';
			document.add_cart_form.method = 'POST';
			document.add_cart_form.submit();
		}
	}
	/*
	제품상세보기에서주문
	 */
	function order_create_form() {
		if (
<%=!isLogin%>
	) {
			alert('로그인 하세요');
			location.href = 'member_login_form.jsp';
		} else {
			document.product_detail_form.p_qty.value = document.add_cart_form.cart_qty.options[document.add_cart_form.cart_qty.selectedIndex].text;
			document.product_detail_form.method = 'POST';
			document.product_detail_form.action = 'order_create_form.jsp';
			document.product_detail_form.submit();
		}
	}
	function productList() {
		location.href = 'product_list.jsp';
	}
	
	
</script>
  <script type="text/javascript">
        $(function() {
            $('.picZoomer').picZoomer();

            $('.piclist li').on('click',function(event){
                var $pic = $(this).find('img');
                $('.picZoomer-pic').attr('src',$pic.attr('src'));
            });
        });
    </script>
    <script>
(function($){
   $.fn.picZoomer = function(options){
      var opts = $.extend({}, $.fn.picZoomer.defaults, options), 
         $this = this,
         $picBD = $('<div class="picZoomer-pic-wp"></div>').css({'width':opts.picWidth+'px', 'height':opts.picHeight+'px'}).appendTo($this),
         $pic = $this.children('img').addClass('picZoomer-pic').appendTo($picBD),
         $cursor = $('<div class="picZoomer-cursor"><i class="f-is picZoomCursor-ico"></i></div>').appendTo($picBD),
         cursorSizeHalf = {w:$cursor.width()/2 ,h:$cursor.height()/2},
         $zoomWP = $('<div class="picZoomer-zoom-wp"><img src="" alt="" class="picZoomer-zoom-pic"></div>').appendTo($this),
         $zoomPic = $zoomWP.find('.picZoomer-zoom-pic'),
         picBDOffset = {x:$picBD.offset().left,y:$picBD.offset().top};

      
      opts.zoomWidth = opts.zoomWidth||opts.picWidth;
      opts.zoomHeight = opts.zoomHeight||opts.picHeight;
      var zoomWPSizeHalf = {w:opts.zoomWidth/2 ,h:opts.zoomHeight/2};

      $zoomWP.css({'width':opts.zoomWidth+'px', 'height':opts.zoomHeight+'px'});
      $zoomWP.css(opts.zoomerPosition || {top: 0, left: opts.picWidth+30+'px'});
      $zoomPic.css({'width':opts.picWidth*opts.scale+'px', 'height':opts.picHeight*opts.scale+'px'});

      $picBD.on('mouseenter',function(event){
         $cursor.show();
         $zoomWP.show();
         $zoomPic.attr('src',$pic.attr('src'))
      }).on('mouseleave',function(event){
         $cursor.hide();
         $zoomWP.hide();
      }).on('mousemove', function(event){
         var x = event.pageX-picBDOffset.x,
            y = event.pageY-picBDOffset.y;

         $cursor.css({'left':x-cursorSizeHalf.w+'px', 'top':y-cursorSizeHalf.h+'px'});
         $zoomPic.css({'left':-(x*opts.scale-zoomWPSizeHalf.w)+'px', 'top':-(y*opts.scale-zoomWPSizeHalf.h)+'px'});

      });
      return $this;

   };
   $.fn.picZoomer.defaults = {
      picWidth: 320,
      picHeight: 320,
      scale: 2.5,
      zoomerPosition: {top: '0', left: '350px'}
      /*,
      zoomWidth: 320,
      zoomHeight: 320*/
   };
})(jQuery);
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="product_detail_form">
		<input type="hidden" name="p_no" value="<%=product.getPNo()%>">
		<input type="hidden" name="p_qty" value="1"> <input
			type="hidden" name="buyType" value="direct">
	</form>

	<!-- container start-->
	<!--  -->
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
									<td bgcolor="FFFFFF" height="22"><font color=#444444
										size=3 style="line-height: 1.3;"> &nbsp;&nbsp;<b>
												지금 <%=product.getPName()%>을 만나보세요! <br> &nbsp;&nbsp; ₩<%=new DecimalFormat("#,##0").format(product.getPPrice())%>~
										</b></font></td>
								</tr>
							</table> <!-- 
							<form name="f" method="post">
							-->
							<table style="margin-left: 10px" border=0 width=80% height=376
								align=center>

								<tr width=100%>
									<td colspan=3 height=5><hr color=#666666></td>
								</tr>
								<tr width=100%>
									<td width=30% class = "picZoomer"  height=200 align=center
										style="padding-left: 50px;"><img border=0
										src='image/product/<%=product.getPImage()%>' width=350
										height=350></td>
										
									<td width=50% height=200 class=t1 style="padding-left: 130px;">
										<ol type="disc">


											<b><br> <br> <br> <br> <font size=5px
												color=#333333> <%=product.getPName()%>&nbsp;&nbsp;&nbsp;
													<br></font><br> </b>



											<font size=5em color=#333333>₩<%=new DecimalFormat("#,##0").format(product.getPPrice())%>~
												&nbsp;&nbsp;&nbsp; <br> <br> <br>

											</font>

											<font size=4em color=#666666 style="line-height: 1.3;"><%=product.getPContent().replace(",", "<br>")%>
												<br> <br> <br> <br></font>

											<font size=1em color=#888888>제품 이상 시 공정거래위원회 고시 소비자
												분쟁해결 기준에 의거 보상합니다</font>
										</ol>
									</td>
									<td width=20% height=200 align=center class=t1>
										<form name="add_cart_form" method="post"
											onsubmit="return add_cart();" action="cart_add_action.jsp">

											<!-- 
											 <input type=text name="cart_qty" value=1 size=4 class=TXTFLD>  
											-->
											<br> <br> <br> <br> <br> <br> <select
												name="cart_qty"
												style="padding-right: 100px; font-size: larger;">
												<option value="1">1
												<option value="2">2
												<option value="3">3
												<option value="4">4
												<option value="5">5
												<option value="6">6
												<option value="7">7
												<option value="8">8
												<option value="9">9
												<option value="10">10
											</select> <br> <br> <a
												href="javascript:add_cart_popup_window(this.parentElement);"
												title="장바구니담기[계속쇼핑팝업]"><img width="160px" height="20px"
												src='image/product/addtocart.png' style="margin-bottom: 5px"></a>
											<input type="hidden" name=p_no value="<%=product.getPNo()%>">
											<br> <br>
											<hr>
											<div class="text-info">
												<font size=2em color=#333333>&nbsp;&nbsp; ◆
													&nbsp;&nbsp; 결제금액의 1% 적립</font> <br>
												<hr>
											</div>

											<div class="text-info">
												<font size=3em color=#555555>&nbsp;&nbsp;Delivery
													Info</font><font size=1em color=#777777>&nbsp;&nbsp;배송정보</font><br>
												<p>출고정보: 결제 3일 이내 출고</p>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(주말 및 공휴일 제외)</p>
												<p>배송정보: 무료 / 국내배송 / CJ대한통운</p>
										
											</div>
										</form>
									</td>


								</tr>
								<tr>
									<td colSpan=3 height=0><hr color=#666666></td>
								</tr>
							</table> <!-- 
							</form>
							-->


							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center><input type="image"
										src="image/product/buy.png" style="width: 60px; height: auto;"
										alt="BUY" onClick="order_create_form();"> &nbsp; <input
										type="image" src="image/product/list.png"
										style="width: 60px; height: auto;" alt="list"
										onClick="productList();"></td>
								</tr>
							</table></td>
					</tr>
				</table>
				<br> <br>
				<form id="myTable">
					<table border="0" cellpadding="20" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<table id="myTable" border="0" cellpadding="0" cellspacing="1"
							width="590" bgcolor="BBBBBB">

							<tbody>
								<tr>
									<td width="30" align="center" bgcolor="E6ECDE"><b><font
											size="2" color="#333333"><%=gradeAvg%> OUT OF 5 STARS</font></b></td>
									<td width="350" align="center" bgcolor="E6ECDE"><b><font
											size="2" color="#333333">CONTENT</font></b></td>
									<td width="30" align="center" bgcolor="E6ECDE"><b><font
											size="2" color="#333333">ID</font></b></td>
									<td width="30" align="center" bgcolor="E6ECDE"><b><font
											size="2" color="#333333">DATE</font></b></td>
								</tr>
								<%
								for (Review review : reviewList) {
								%>
								<tr>
									<td width="30" bgcolor="ffffff" style="padding-left: 10px"
										align="center"><font size="2" color="#FBB117"><%=review.getRStar()%></font>
									</td>
									<td width="350" align="left" bgcolor="ffffff"><font
										size="2" color="#333333"><%=review.getRContent()%></font></td>
									<td width="30" bgcolor="ffffff" style="padding-left: 10px"
										align="center"><font size="2" color="#333333"><%=review.getMId()%></font>
									</td>
									<td width="30" align="center" bgcolor="ffffff"><font
										size="2" color="#333333"><%=review.getRDate().toLocaleString().substring(0, 11)%></font>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</table>
					<br> <br>
				</form>
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