<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html >
<html>
<head>
<title>사과상점</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/table.css" type="text/css">
<link rel="icon" type="image/png"  href="../image/icons8-맥-os-32.png">

<style type="text/css" media="screen">
</style>
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
//계정 생성 유효성 체크
	function memberCreate() {
		if (document.f.mId.value == "") {
			alert("아이디를 입력하세요.");
			f.mId.focus();
			return false;
		}
		
		if (document.f.mId.value !== "") {
		    let id = document.f.mId.value;

		    if (/[^a-zA-Z0-9]/.test(id)) {
		        alert("아이디에는 영문 대소문자와 숫자만 사용할 수 있습니다.");
		        document.f.mId.focus();
		        return false;
		    }
		}
		
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
		if (f.mPw.value != f.mPw2.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			f.mPw.focus();
			f.mPw.select();
			return false;
		}
		f.action = "member_write_action.jsp";
		f.method = 'POST';
		f.submit();
	}

	function goHome() {
		f.action = "shop_main.jsp";
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
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">

				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원 가입</b></td>
								</tr>
							</table> <!-- write Form  -->
							<form id = "myTable" name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="mId" value="">&nbsp;&nbsp;<font color="red"></font>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px"
											name="mPw" value=""></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호
											확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="password" style="width: 150px"
											name="mPw2" value=""></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="mName" value=""></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">연락처</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left">
											<input type="text" style="width: 38px"	name="mPhone1" value=""> -
											<input type="text" style="width: 38px"	name="mPhone2" value=""> -
											<input type="text" style="width: 38px"	name="mPhone3" value="">
											 
											 </td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이메일주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 70px"
											name="mEmail1" value=""> @ <input type="text"
											style="width: 80px" name="mEmail2" value=""></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">배송지주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="mAddress" value=""> <input type="button"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
										</td>
									</tr>
								</table>
							</form> <br />

							<table border=0 cellpadding=0 cellspacing=1>
								<tr>
									<td align=center><input type="button" value="회원 가입"
										onclick="memberCreate();"> &nbsp; <input type="button"
										value="홈" onClick="goHome()"></td>
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
