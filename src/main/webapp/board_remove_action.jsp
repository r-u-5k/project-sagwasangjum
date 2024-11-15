<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그인여부체크
String sMemberId = (String) session.getAttribute("sMemberId");
if (sMemberId == null) {
	response.sendRedirect("board_list.jsp");
	return;
}
%>
<%
	Integer boardno = null;
	Integer pageno = null;
	try {
		boardno = Integer.valueOf(request.getParameter("b_no"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result = true;
	String msg = "";
	if (boardno == null) {
		result = false;
		msg = "해당 게시글이 존재하지 않습니다.";
	} else {
		try {
			new BoardService().remove(boardno);
			result = true;
			msg = "삭제하였습니다.";
		} catch (BoardException e) {
			result = false;
			msg = "[이 게시글은 관리자만 삭제 할 수 있습니다.]";
		}
	}
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='board_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='board_list.jsp?pageno=<%=pageno%>';
<%}%>
	
</script>




