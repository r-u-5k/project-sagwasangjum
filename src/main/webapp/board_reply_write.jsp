<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.member.MemberService"%>
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
MemberService memberService = new MemberService();
Member member = memberService.findMember(sMemberId);
%>
<%
//댓글의 대상글번호를 읽어서 변수에 저장
if (request.getParameter("b_no") == null) {
	response.sendRedirect("board_list.jsp");
	return;
}
int boardno = Integer.parseInt(request.getParameter("b_no"));
Board board = new BoardService().findBoard(boardno);
if (board == null) {
	response.sendRedirect("board_list.jsp");
	return;
}
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/table.css" type="text/css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">


<script type="text/javascript">
	function boardReplayCreate() {
		if (f.b_title.value == "") {
			alert("제목을 입력하세요.");
			f.b_title.focus();
			return false;
		}
		if (f.b_writer.value == "") {
			alert("작성자를 입력하세요.");
			f.b_writer.focus();
			return false;
		}
		if (f.b_content.value == "") {
			alert("내용을 입력하세요.");
			f.b_content.focus();
			return false;
		}
		f.action = "board_reply_write_action.jsp";
		f.method = 'POST';
		f.submit();
	}

	function boardList() {
		f.action = "board_list.jsp";
		f.submit();
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


									<td bgcolor="ffffff" height="22"><font size="5"><b>답글
												달기</b></td>

								</tr>
							</table> <br> <!-- write Form  -->
							<form id="myTable" name="f" method="post">
								<input type="hidden" name="pageno" value="<%=pageno%>" /> 
								<input type="hidden" name="m_id" value="<%=member.getMId()%>" />
								<input type="hidden" name="b_no" value="<%=board.getBNo()%>" />

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input value="[RE]<%=board.getBTitle()%>"
											type="text" style="width: 150" name="b_title"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=member.getMName()%>
											<input value="<%=member.getMName()%>"
											type="hidden" style="width: 150" name="b_writer"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="b_content" class="textarea"
												style="width: 350px" rows="14">>><%=board.getBContent().replace("\n", ">>").trim()%></textarea>
										</td>
									</tr>


								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="답글 작성하기" onClick="boardReplayCreate()"> &nbsp;
										<input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="목록으로 이동" onClick="boardList()"></td>
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