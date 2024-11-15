
<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean isDuplicate = false;
Member findM = new Member();
String findMPw = "";
String msg = "";
//request.setCharacterEncoding("UTF-8");
String mId = request.getParameter("mId");
String mName = request.getParameter("mName");
if (mId == null || mId.equals("") || mName == null || mName.equals("")) {
	//최초윈도우를 띄울때
	mId = "";
	mName = "";
	msg = "";
	isDuplicate = true;
} else {
	MemberService memberService = new MemberService();
	isDuplicate = memberService.isDuplicateId(mId);
	findM = memberService.findMemberPw(mId, mName);

	if (!isDuplicate) {
		msg = "아이디가 존재하지 않습니다.";
		isDuplicate = true;
	} else {
		if (findM == null) {
	msg = "아이디와 이름이 일치하지 않습니다.";
	isDuplicate = true;
		} else {
	findMPw = (memberService.findMemberPw(mId, mName)).getMPw();
	isDuplicate = false;
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<title>비밀번호 찾기</title>

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
	//PW 찾기 기능
	function findPw() {

		var mId = document.getElementById("mId").value;
		var mName = document.getElementById("mName").value;
		if (mId == null || mId == '') {
			alert('아이디를 입력하세요.');
			findPwForm.mId.focus();
			return false;
		}
		if (mName == null || mName == '') {
			alert('이름을 입력하세요.');
			findPwForm.mName.focus();
			return false;
		}
		document.getElementById('findPwForm').action = 'member_open_find_pw.jsp';
		document.getElementById('findPwForm').method = 'POST';
		document.getElementById('findPwForm').submit();

	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		// 중복체크 결과인 idCheck 값을 전달한다.
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.f.findPw.value = window.document.getElementById('mId').value;
		window.close();
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray">패스워드 찾기</font></b>
		<hr size="0.5" style="margin: 0 0 0 0">
		<%
		if (!isDuplicate) {
		%>

	</div>
	<div id="chk" style="margin-top: 10px">
		<form id="findPwForm" style="display: inline;">
			<td width=100 align=center bgcolor="E6ECDE" height="22"><%=mName%>님의 비밀번호는 <%=findMPw%>입니다.
		</form>
		<%
		} else {
		%>
		<div id="chk" style="margin-top: 10px">
			<form id="findPwForm" style="display: inline;">
				<td width=100 align=center bgcolor="E6ECDE" height="22">아이디 
				<input 
					type="text" style="border-radius: 5px;" name="mId" id="mId" value="<%=mId%>">
				</td> <br><br>
				<td width=100 align=center bgcolor="E6ECDE" height="22">&nbsp;이름&nbsp;&nbsp; 
				<input 
					type="text" style="border-radius: 5px;" name="mName" id="mName" value="<%=mName%>">
					<br><br>
			</form>
			<%
			}
			%>

			<%
			if (!isDuplicate) {
			%>
			<div id="msg"
				style="font-size: 7pt; margin: 7px; text-align: left; color: blue; font-weight: bold"><%=msg%></div>

			<input id="okBtn" type="button"
				style="background-color: white; border: 1px; cursor: pointer;"
				value="확인" style="font-size: 7pt" onclick="window.close();">
			<%
			} else {
			%>
			<div id="msg"
				style="font-size: 7pt; margin: 7px; text-align: left; color: red; font-weight: bold"><%=msg%></div>
			<input type="button"
				style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
				value="패스워드 찾기" onclick="findPw()" style="font-size: 7pt"> <input
				id="closeBtn"
				style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
				type="button" value="닫기" style="font-size: 7pt"
				onclick="window.close();">
			<%
			}
			%>

		</div>
	</div>
</body>
</html>