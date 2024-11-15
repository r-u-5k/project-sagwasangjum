
<%@page import="com.itwill.shop.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//아이디 중복체크
boolean isDuplicate = false;
String msg = "";
//request.setCharacterEncoding("UTF-8");
String mId = request.getParameter("mId");
if (mId == null || mId.equals("")) {
	//최초윈도우를 띄울때
	mId = "";
	msg = "";
	isDuplicate = true;
} else {
	MemberService memberService = new MemberService();
	isDuplicate = memberService.isDuplicateId(mId);
	if (isDuplicate) {
		msg = "이미 사용 중인 아이디입니다.";
	} else {

		for (int i = 0; i < mId.length(); i++) {
	if ((int) (mId.charAt(i)) >= 32 && (int) (mId.charAt(i)) <= 47
			|| (int) (mId.charAt(i)) >= 58 && (int) (mId.charAt(i)) <= 64
			|| (int) (mId.charAt(i)) >= 91 && (int) (mId.charAt(i)) <= 96
			|| (int) (mId.charAt(i)) >= 123 && (int) (mId.charAt(i)) <= 126) {
		msg = "아이디에는 영문 대소문자와 숫자만 사용할 수 있습니다.";
		isDuplicate = true;
	} else {
		msg = "사용 가능한 아이디입니다";
	}
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<title>아이디 중복 체크</title>

<style type="text/css">
#wrap {
	width: 250px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: visible;
}
</style>

<script type="text/javascript">
	//아이디 중복체크
	function idCheck() {

		var mId = document.getElementById("mId").value;
		if (mId == null || mId == '') {
			alert('검색할 아이디를 입력하시고 중복체크를 하세요.');
			return;
		}

		document.getElementById('checkForm').action = 'member_id_check_form.jsp';
		document.getElementById('checkForm').method = 'POST';
		document.getElementById('checkForm').submit();

	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		var mId = document.getElementById("mId").value;
		if (mId == null || mId == '') {
			alert('검색할 아이디를 입력하시고 중복체크를 하세요.');
			return;
		}

		// 중복체크 결과인 idCheck 값을 전달한다.
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.f.mId.value = window.document.getElementById('mId').value;
		window.close();
	}
	function resetText() {
		// 클릭시 텍스트 삭제.
		useBtn.disabled = true;
		f.mId.focus();
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray">아이디 중복체크</font></b>
		<hr size="0.5" style="margin: 0 0 0 0">
		<div id="chk" style="margin-top: 10px">
			<form id="checkForm" style="display: inline;">
				<input onclick="resetText();" type="text" style="width: 150px;border-radius: 5px;"
					name="mId" id="mId" value="<%=mId%>">&nbsp;&nbsp; <input
					type="button"
					style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
					value="중복확인" onclick="idCheck()" yystyle="font-size: 7pt">
			</form>
			<%
			if (!isDuplicate) {
			%>
			<div id="msg"
				style="font-size: 7pt; margin: 7px; text-align: left; color: blue; font-weight: bold"><%=msg%></div>
			<input id="useBtn" type="button"
				style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
				value="사용" style="font-size: 7pt" onclick="sendCheckValue()">
			<%
			} else {
			%>
			<div id="msg"
				style="font-size: 7pt; margin: 7px; text-align: left; color: red; font-weight: bold"><%=msg%></div>
			<input id="useBtn" type="button"
				style="background-color: white; border: 1px solid black; border-radius: 5px;"
				disabled="disabled" value="사용" onclick="sendCheckValue()">
			<%
			}
			%>
			<input id="cancelBtn" type="button"
				style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
				value="취소" style="font-size: 7pt" onclick="window.close();">
		</div>
	</div>
</body>
</html>