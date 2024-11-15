<%-- <%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String sMemberId = (String) session.getAttribute("sMemberId");
    Member sMember = null;
    int cart_item_count = 0;

    if (sMemberId != null) {
        sMember = new MemberService().findMember(sMemberId);
        CartService cartService = new CartService();
        cart_item_count = cartService.getCartItemByMemberId(sMemberId).size();
    }
%>

<script type="text/javascript">
    function login_message() {
        alert('로그인하세요');
        location.href = 'member_login_form.jsp';
    }
</script>

<p><strong>메뉴</strong></p>
<ul>
    <% if (sMemberId == null) { %>
        <li><a href="member_login_form.jsp">로그인</a></li>
        <li><a href="member_write_form.jsp">회원가입</a></li>
        <li><a href="member_write_form_popup.jsp">회원가입[팝업]</a></li>
        <li><a href="#" onclick="return false;"></a></li>
        <li><a href="javascript:login_message();">장바구니</a></li>
    <% } else { %>
        <li><a href="member_view.jsp"><%= sMember.getMName() + "님" %></a></li>
        <li><a href="member_logout_action.jsp">로그아웃</a></li>
        <li><a href="#" onclick="return false;"a></a></li>
        <li><a href="cart_view.jsp">장바구니<span class="w3-badge w3-badge-menu w3-green cart_item_count"><%= cart_item_count %></span></a></li>
        <li><a href="#" onclick="return false;"></a></li>
        <li><a href="order_list_orderitem2.jsp">주문목록</a></li>
    <% } %>

    <li><a href="#" onclick="return false;"></a></li>
    <li><a href="product_list.jsp">전체상품</a></li>
    <li><a href="product_iphone_list.jsp">아이폰</a></li>
    <li><a href="product_macbook_list.jsp">맥북</a></li>
    <li><a href="product_ipad_list.jsp">아이패드</a></li>
    <li><a href="product_watch_list.jsp">워치</a></li>
    <li><a href="product_airpod_list.jsp">에어팟</a></li>
    <li><a href="#" onclick="return false;"></a></li>
    <li><a href="board_list.jsp">공지사항</a></li>
    <li><a href="board_write.jsp">게시판쓰기</a></li>
</ul>
 --%>