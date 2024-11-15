<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sMemberId = (String) session.getAttribute("sMemberId");

if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("board_list.jsp");
	return;
}

Board board = new Board();
board.setBTitle(request.getParameter("b_title"));
board.setBWriter(request.getParameter("b_writer"));
board.setBContent(request.getParameter("b_content"));
board.setMId(request.getParameter("m_id"));

new BoardService().create(board);
response.sendRedirect("board_list.jsp");
%>
