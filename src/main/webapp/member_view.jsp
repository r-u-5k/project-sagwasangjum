<%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="com.itwill.shop.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
MemberService memberService = new MemberService();
Member member = memberService.findMember(sMemberId);
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
	//수정버튼 클릭 시 수정기능, 수정 화면으로 전환
	function memberModify() {
		document.f.action = "member_modify_form.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
	//삭제버튼 클릭 시 삭제기능, 삭제 화면으로 전환
	function memberRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "member_remove_action.jsp";
			document.f.method = 'POST';
			document.f.submit();
		}
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
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="ffffff" height="22"><font size="5"><b>내 정보</b></td>
								</tr>
							</table> <!-- view Form  -->
							<form id="myTable" name="f" method="post">
								<table id="myTable" border="0" cellpadding="0" cellspacing="1"
									width="590" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=member.getMId()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=member.getMName()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">연락처</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=member.getMPhone()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">이메일</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=member.getMEmail()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">배송지주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<%=member.getMAddress()%>
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>

									<td align=center><input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="내 정보 수정" onClick="memberModify()">&nbsp; <input
										type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="탈퇴" onClick="memberRemove()">&nbsp;</td>

								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>

			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer" >
			<!-- include_common_bottom.jsp start-->

			<jsp:include page="include_common_bottom.jsp"/>

			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
