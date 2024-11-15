<%@page import="com.itwill.shop.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sMemberId = (String) session.getAttribute("sMemberId");

if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("board_list.jsp");
	return;
}

	//Board객체를 생성하고 입력된데이타를 읽어서 객체에저장
	Board board=new Board();
	/*
	원글boardno
	*/
	board.setBNo(
			Integer.parseInt(request.getParameter("b_no")));
	/*
	답글 데이타
	*/
	board.setBTitle(request.getParameter("b_title"));
	board.setBWriter(request.getParameter("b_writer"));
	board.setBContent(request.getParameter("b_content"));
	board.setMId(request.getParameter("m_id"));
	new BoardService().createReply(board);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("board_list.jsp?pageno=%s",pageno));
	
%>