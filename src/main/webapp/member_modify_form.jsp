<%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="com.itwill.shop.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("shop_main.jsp");
	return;
}
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	//주소 검색기능
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				console.log(data.address);

				document.f.mAddress.value = data.address;
			}
		}).open();
	}
</script>
<script type="text/javascript">
	//멤버 정보 수정 유효성 체크
	function memberModifyAction() {
		if (f.mPw.value == "") {
			alert("비밀번호를 입력하세요.");
			f.mPw.focus();
			return false;
		}
		if (f.mPw2.value == "") {
			alert("비밀번호 확인을 입력하세요.");
			f.mPw2.focus();
			return false;
		}
		if (document.f.mPw.value != f.mPw2.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			f.mPw.focus();
			f.mPw.select();
			return false;
		}
		if (f.mName.value == "") {
			alert("이름을 입력하세요.");
			f.mName.focus();
			return false;
		}
		if (f.mPhone1.value == "") {
			alert("연락처를 입력하세요.");
			f.mPhone1.focus();
			return false;
		}
		if (f.mPhone2.value == "") {
			alert("연락처를 입력하세요.");
			f.mPhone2.focus();
			return false;
		}
		if (f.mPhone3.value == "") {
			alert("연락처를 입력하세요.");
			f.mPhone3.focus();
			return false;
		}
		if (f.mEmail1.value == "") {
			alert("이메일 주소를 입력하세요.");
			f.mEmail1.focus();
			return false;
		}
		if (f.mEmail2.value == "") {
			alert("이메일 주소를 입력하세요.");
			f.mEmail2.focus();
			return false;
		}
		if (f.mAddress.value == "") {
			alert("배송지주소를 입력하세요.");
			f.mAddress.focus();
			return false;
		}

		document.f.action = "member_modify_action.jsp";
		document.f.method = 'POST';
		document.f.submit();
	}

	function subEmail() {
		var selectedEmail = document.getElementById("sub_email2").value;
		document.getElementById("mEmail2").value = selectedEmail;
		f.mEmail2.focus();
	}
	function memberview() {
		f.action = "member_view.jsp";
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
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="ffffff" height="22"><font size="5"><b>내 정보 수정</b></td>
								</tr>
							</table> <!-- update Form  -->
							<form id="myTable" name="f" method="post">
								<table id="myTable" border="0" cellpadding="0" cellspacing="1"
									width="590" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=member.getMId()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px; border-radius: 5px;"
											name="mPw" value="<%=member.getMPw()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">비밀번호
											확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px; border-radius: 5px;"
											name="mPw2" value="<%=member.getMPw()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px; border-radius: 5px;"
											name="mName" value="<%=member.getMName()%>"></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">연락처</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 38px; border-radius: 5px;"
											name="mPhone1" value="<%=member.getMPhone().substring(0, member.getMPhone().indexOf("-"))%>">
											- <input type="text" style="width: 38px; border-radius: 5px;" name="mPhone2"
											value="<%=(member.getMPhone().substring(member.getMPhone().indexOf("-")+1))
														.substring(0,(member.getMPhone().substring(member.getMPhone().indexOf("-")+1).indexOf("-")))%>"> - <input
											type="text" style="width: 38px; border-radius: 5px;" name="mPhone3"
											value="<%=(member.getMPhone().substring(member.getMPhone().indexOf("-")+1))
														.substring((member.getMPhone().substring(member.getMPhone().indexOf("-")+1).indexOf("-") + 1))%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이메일</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 70px; border-radius: 5px;"
											name="mEmail1"
											value="<%=member.getMEmail().substring(0, member.getMEmail().indexOf('@'))%>">
											@ <input type="text" style="width: 80px; border-radius: 5px;" name="mEmail2"
											id="mEmail2"
											value="<%=member.getMEmail().substring(member.getMEmail().indexOf('@') + 1)%>">
											<select name="sub_email2" id="sub_email2"
											style="padding-right: 100px; border-radius: 5px; font-size: larger;"
											onchange="subEmail()">
												<option value="">선택하세요.
												<option value="naver.com">naver.com
												<option value="daum.net">daum.net
												<option value="nate.com">nate.com
												<option value="gmail.com">gmail.com
												<option value="">직접입력
										</select> <br>
										<br></td>

									</tr>
									<tr>
										<td width=100 align=center bgcolor="ffffff" height="22">배송지주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px; border-radius: 5px;"
											name="mAddress" value="<%=member.getMAddress()%>"> <input
											type="button"
											style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
											"
											onclick="sample4_execDaumPostcode()"
											value="우편번호 찾기"></td>
									</tr>
								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="내 정보 수정" onClick="memberModifyAction();"> &nbsp;
									<input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="취소" onClick="memberview();"> &nbsp;
										</td>
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
		<div id="footer">
			<!-- include_common_bottom.jsp start-->

			<jsp:include page="include_common_bottom.jsp" />

			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
