<%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.board.util.PageMaker"%>
<%@page import="com.itwill.shop.board.BoardListPageMakerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@page import="com.itwill.shop.board.BoardService"%>
<%@page import="com.itwill.shop.board.PageInputDto"%>

<%
String sMemberId = (String) session.getAttribute("sMemberId");

MemberService memberService = new MemberService();
Member member = memberService.findMember(sMemberId);


%>

<%!public String getTitleString(Board board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getBTitle();
		if (t.length() > 15) {
			//t = t.substring(0,15);
			//t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입

		for (int i = 0; i < board.getBDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}

		if (board.getBDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}

		title.append(t.replace(" ", "&nbsp;"));

		return title.toString();
	}%>

<%
// 요청페이지번호	
String pageno = request.getParameter("pageno");
if (pageno == null || pageno.equals("")) {
	pageno = "1";
}

//게시물조회

BoardListPageMakerDto boardListPage = new BoardService().findBoardList(Integer.parseInt(pageno));
%>
<!DOCTYPE html>
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/table.css" type="text/css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">
<script type="text/javascript">
function boardCreate() {
	<% if (member != null) { %>
	f.action = "board_write.jsp";
	f.submit();
	<%} else {%>
	var confirmed = confirm("로그인 후 문의하실 수 있습니다.");
	if (confirmed) {
		document.f.action = "member_login_form.jsp";
		document.f.submit();
	}
	<%}%>
}
</script>
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
									<td bgcolor="#FFFFFF" height="40"><font size="5"> <b>고객
											지원</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">📄
										총 <font color="#FF0000"><%=boardListPage.pageMaker.getTotCount()%></font>
										건 | 현재 페이지 ( <font color="#FF0000"><%=boardListPage.pageMaker.getCurPage()%></font>
										/ <font color="#0000FF"><%=boardListPage.pageMaker.getTotPage()%></font> )
									</td>
								</tr>
							</table> <!-- list -->
							<form id = "myTable" name="f" method="post" action="">
								<table id = "myTable" border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">문의사항</td>
										<td width=120 align=center bgcolor="E6ECDE">작성자</td>
										<td width=120 align=center bgcolor="E6ECDE">작성일</td>
										<td width=70 align=center bgcolor="E6ECDE">조회수</td>
									</tr>
									<%
									for (Board board : boardListPage.boardList) {
									%>
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><a
											href='board_view.jsp?b_no=<%=board.getBNo()%>&pageno=<%=boardListPage.pageMaker.getCurPage()%>'>
												<%=this.getTitleString(board)%>
										</a></td>
										<td width=120 align=center bgcolor="#FFFFFF"><%=board.getBWriter()%>
										</td>
										<td width=120 bgcolor="#FFFFFF" style="padding-left: 10px"
											align="center"><%=board.getBDate().toLocaleString().substring(0, 11)%>
										</td> 
										<td width=70 align=center bgcolor="ffffff" align="left"><%=board.getBReadCount()%>
										</td>
									</tr>

									<%
									}
									%>
								</table>
								<!-- /list -->
							</form>

							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
										<%
										if (boardListPage.pageMaker.getCurBlock() > 1) {
										%> <a
										href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getPrevGroupStartPage()%>">◀◀</a>&nbsp;
										<%}%> <%
										if (boardListPage.pageMaker.getPrevPage() > 0) {
										%> <a
										href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										<%}%> <%
										for (int i = boardListPage.pageMaker.getBlockBegin(); i <= boardListPage.pageMaker.getBlockEnd(); i++) {
											if (boardListPage.pageMaker.getCurPage() == i) {
										%> <font color='red'><strong><%=i%></strong></font>&nbsp; <%} else {%> <a
										href="./board_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										}
										}
										%> <%
										if (boardListPage.pageMaker.getNextPage() <= boardListPage.pageMaker.getTotPage()) {
										%> <a
										href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getNextPage()%>">▶</a>
										<%}%> <%
										if (boardListPage.pageMaker.getTotBlock() > boardListPage.pageMaker.getCurBlock()) {
										%> <a
										href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getNextGroupStartPage()%>">▶▶&nbsp;</a>
										<%}%>

									</td>
								</tr>
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right"><input type="button" value="문의하기" style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										onclick="boardCreate();" /></td>
								</tr>
							</table></td>
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