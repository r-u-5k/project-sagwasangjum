<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/table.css" type="text/css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">


<script type="text/javascript">
	//아이디 찾기 기능
	function openfindId() {
		var left = Math.ceil((window.screen.width) / 5);
		var top = Math.ceil((window.screen.height) / 5);
		let idCheckWindow = window
				.open(
						"member_open_find_id.jsp",
						"findIdForm",
						"width=430,height=200,top="
								+ top
								+ ",left="
								+ left
								+ ",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
	}
	//패스워드 찾기 기능
	function openfindPw() {
		var left = Math.ceil((window.screen.width) / 5);
		var top = Math.ceil((window.screen.height) / 5);
		let idCheckWindow = window
				.open(
						"member_open_find_pw.jsp",
						"findPwForm",
						"width=430,height=200,top="
								+ top
								+ ",left="
								+ left
								+ ",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
	}
	//로그인 기능
	function memberCreate() {
		f.action = "member_write_form_popup.jsp";
		f.submit();
	}
	//로그인 유효성 체크
	function login() {
		if (f.mId.value == "") {
			alert("아이디를 입력하세요.");
			f.mId.focus();
			return false;
		}
		if (f.mPw.value == "") {
			alert("비밀번호를 입력하세요.");
			f.mPw.focus();
			return false;
		}

		f.action = "member_login_action.jsp";
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
									<td bgcolor="FFFFFF" height="22"><font size="5"><b>로그인</b></td>
								</tr>
							</table> <!-- login Form  -->
							<form id="myTable" name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input  type="text"
											style="width: 150; border-radius: 5px;" name="mId" value="">&nbsp;&nbsp; <font
											color="red"></font> <input type="button"
											style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
											onclick="openfindId()" value="아이디를 잊으셨나요?"></td>

									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="password"
											style="width: 150; border-radius: 5px;" name="mPw" value="">&nbsp;&nbsp; <font
											color="red"></font> <input type="button"
											style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
											onclick="openfindPw()" value="패스워드를 잊으셨나요?"></td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center><input type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="로그인" onClick="login();"> &nbsp; <input
										type="button"
										style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer; font-weight: bold;"
										value="회원가입" onClick="memberCreate()"></td>
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
