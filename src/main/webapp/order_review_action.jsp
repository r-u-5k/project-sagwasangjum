<%@page import="com.itwill.shop.product.ReviewService"%>
<%@page import="com.itwill.shop.product.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
    response.sendRedirect("shop_main.jsp");
    return;
}

String pNoStr = request.getParameter("p_no"); 
String rating = request.getParameter("rating"); 
String reviewText = request.getParameter("reviewText"); 

System.out.println(pNoStr);
System.out.println(rating);
System.out.println(reviewText);

ReviewService reviewService = new ReviewService();
Review review = Review.builder()
                    .mId(sMemberId)
                    .pNo(Integer.parseInt(pNoStr))
                    .rStar(rating)
                    .rContent(reviewText)
                    .build();
int reviewInserted = reviewService.insert(review);

if(reviewInserted==1) {
    // 리뷰 삽입이 성공했을 때 창을 닫음
    out.println("<script>window.close();opener.location.href='product_detail.jsp?p_no="+pNoStr+"';</script>");
} else {
    // 리뷰 삽입에 실패했을 때 추가적인 처리
    // 실패했을 경우 메시지를 출력하거나 다른 처리를 할 수 있습니다.
    out.println("<script>alert('리뷰 삽입에 실패했습니다.');</script>");
}
%>
