<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
String pNoStr =request.getParameter("p_no"); 
ProductService productService = new ProductService();
Product product=productService.selectByPNo(Integer.parseInt(pNoStr));
 %>

 <script type="text/javascript">

    // 리뷰 작성 후 창을 닫기 위한 함수
    function submitReview() {
    	 // 상품 상세 페이지로 이동
    	 
        window.location.href = 'product_detail.jsp?p_no=<%=product.getPNo()%>';
        // 창을 닫기 위한 함수 호출
        window.close();
    }
	
</script>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="css/review.css" type="text/css">

<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">
<title>리뷰 작성</title>
</head>
<body>
	
    <h2><br>리뷰 작성</h2>
    <form action="order_review_action.jsp" method="post" >
        <img width="100px" height="100px" src="image/product/<%=product.getPImage() %>" border="0"><br>
        <label for="productName"><%=product.getPName() %></label><br><br>
        <input type="hidden" name="p_no" value="<%=product.getPNo()%>">
        <label for="rating">평점:</label><br>
        <select id="rating" name="rating" required>
            <option value="★★★★★">★★★★★</option>
            <option value="★★★★">★★★★</option>
            <option value="★★★">★★★</option>
            <option value="★★">★★</option>
            <option value="★">★</option>
        </select><br><br>
        
        <label for="reviewText"></label><br>
        <textarea id="reviewText" name="reviewText" rows="4" cols="50" required></textarea><br><br>
        
        <input type="submit" value="리뷰 제출" style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;">
        <br><br>
    </form>
</body>
</html>