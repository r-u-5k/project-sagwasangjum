<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="com.itwill.shop.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sMemberId = (String) session.getAttribute("sMemberId");

MemberService memberService = new MemberService();
Member member = memberService.findMember(sMemberId);


%>
<%

	Integer bNo=null;
	int pageno=1;
	try{
		bNo=Integer.parseInt(request.getParameter("b_no"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		
	}
	if(bNo==null){
		//목록으로이동
		response.sendRedirect("board_list.jsp?pageno="+pageno);
		return;
	}
	Board board=new BoardService().findBoard(bNo);
	if(board==null){
		response.sendRedirect("board_list.jsp?pageno="+pageno);
		return;
	}
	//읽은회수증가
	new BoardService().updateCount(bNo);
	
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

<script>
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
  function boardReplyCreate() {
		document.f.action = "board_reply_write.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	function boardUpdate() {
		document.f.action = "board_modify.jsp";
		document.f.submit();
	} 
	function boardRemove() {
		if (confirm("정말 삭제하시겠습니까? (삭제 시 게시글은 복구할 수 없습니다.)")) {
			document.f.action = "board_remove_action.jsp";
			document.f.submit();
		}
	}
	 function boardList() {
		f.action = "board_list.jsp?pageno="+<%=pageno%>;
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
									<td bgcolor="ffffff" height="22"><font size="5"><b>
												문의 내용</b></td>
								</tr>
							</table> <br> <!-- view Form  --> <!-- 
							<form name="f" method="post">
					<input type="hidden" name="boardno" value="<%=board.getBNo()%>">
					<input type="hidden" name="pageno" value="<%=pageno%>">
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getBWriter()%></td>
						</tr>

						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getBTitle()%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getBContent()%></td>
						</tr>
						
					</table>
					
				</form>
							 -->
							<form id="myTable" name="f" method="post">
								<input type="hidden" name="m_id" value="<%=board.getMId()%>">
								<input type="hidden" name="b_no" value="<%=board.getBNo()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getBWriter()%></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getBTitle()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" height="180px"
											style="padding-left: 10px" align="left"><%=board.getBContent().replace("\n", "<br/>")%><br />

										</td>
									</tr>

								</table>

							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="추가 문의하기" onclick="boardCreate()"> &nbsp; 
										<%if (member != null) {%>  
                                        <input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="답글 작성하기" onClick="boardReplyCreate()"> &nbsp; 
										<% if (member.getMId().equals(board.getMId())) { %>
										<input
										type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="수정하기" onClick="boardUpdate()"> &nbsp; <input
										type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="삭제하기" onClick="boardRemove()"> &nbsp; 
										<%} %>
										<%}%> 
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