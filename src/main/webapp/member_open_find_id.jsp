
<%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="com.itwill.shop.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
boolean isDuplicate = false;
Member findM = new Member();
String findMId = "";
String msg = "";
//request.setCharacterEncoding("UTF-8");
String mName = request.getParameter("mName");
String mPhone1 = request.getParameter("mPhone1");
String mPhone2 = request.getParameter("mPhone2");
String mPhone3 = request.getParameter("mPhone3");
String mPhone = mPhone1 + "-" + mPhone2 + "-" + mPhone3;
if (mName == null || mName.equals("") || mPhone == null || mPhone.equals("")) {
	//최초윈도우를 띄울때
	mName = "";
	mPhone1 = "";
	mPhone2 = "";
	mPhone3 = "";
	mPhone = "";
	msg = "";
	isDuplicate = true;
} else {
	MemberService memberService = new MemberService();
	findM = memberService.findMemberId(mName, mPhone);

	if (findM == null) {
		msg = "이름과 연락처가 일치하지 않습니다.";
		isDuplicate = true;
	} else {
		findMId = (memberService.findMemberId(mName, mPhone)).getMId();
		isDuplicate = false;
	}

}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">

<title>아이디 찾기</title>

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
	//ID 찾기 기능
	function findId() {
		var mName = document.getElementById("mName").value;
		var mPhone1 = document.getElementById("mPhone1").value;
		var mPhone2 = document.getElementById("mPhone2").value;
		var mPhone3 = document.getElementById("mPhone3").value;
		if (mName == null || mName == '') {
			alert('이름을 입력하시고 찾기를 눌러주세요.');
			findIdForm.mName.focus();
			return false;
		}
		if (mPhone1 == null || mPhone1 == '') {
			alert('연락처를 입력하시고 찾기를 눌러주세요.');
			findIdForm.mPhone1.focus();
			return false;
		}
		if (mPhone2 == null || mPhone2 == '') {
			alert('연락처를 입력하시고 찾기를 눌러주세요.');
			findIdForm.mPhone2.focus();
			return false;
		}
		if (mPhone3 == null || mPhone3 == '') {
			alert('연락처를 입력하시고 찾기를 눌러주세요.');
			findIdForm.mPhone3.focus();
			return false;
		}
		document.getElementById('findIdForm').action = 'member_open_find_id.jsp';
		document.getElementById('findIdForm').method = 'POST';
		document.getElementById('findIdForm').submit();

	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		var mId = document.getElementById("mId").value;
		// 중복체크 결과인 idCheck 값을 전달한다.
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.f.mId.value = window.document.getElementById('mId').name;
		window.close();
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray">아이디 찾기</font></b>
		<hr size="0.5" style="margin: 0 0 0 0">
		<%
		if (!isDuplicate) {
		%>
	</div>
	<div id="chk" style="margin-top: 10px">
		<form id="findIdForm" style="display: inline;">
			<td width=100 align=left bgcolor="E6ECDE" height="22"><%=mName%>님의 아이디는 <%=findMId%>입니다.
		</form>
		<%
		} else {
		%>
		<div id="chk" style="margin-top: 10px">
			<form id="findIdForm" style="display: inline;">

				<td width=100 align=left bgcolor="E6ECDE" height="22">&nbsp;&nbsp;&nbsp;이
					름&nbsp;&nbsp; <input  type="text" name="mName" id="mName"
					value="<%=mName%>" style="width: 180px;border-radius: 5px;">
				</td> <br><br>
				<td width=100 align=center bgcolor="E6ECDE" height="22">연락처
					&nbsp; 
					<input  type="text" style="width: 35px;border-radius: 5px;" name="mPhone1"
					id="mPhone1" value="<%=mPhone1%>"> - 
					<input  type="text"
					style="width: 44px;border-radius: 5px;" name="mPhone2" id="mPhone2"
					value="<%=mPhone2%>"> - 
					<input  type="text"
					style="width: 44px;border-radius: 5px;" name="mPhone3" id="mPhone3"
					value="<%=mPhone3%>">
				</td>
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

			<input type="button"
				style="background-color: white; border: 1px; cursor: pointer;"
				name=<%=findMId%> id="mId" value="로그인" style="font-size: 7pt"
				onclick="sendCheckValue()"> <input id="okBtn" type="button"
				style="background-color: white; border: 1px; cursor: pointer;"
				value="확인" style="font-size: 7pt" onclick="window.close();">
			<%
			} else {
			%>
			<div id="msg"
				style="font-size: 7pt; margin: 7px; text-align: left; color: red; font-weight: bold"><%=msg%></div>
			<input type="button"
				style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
				value="아이디 찾기" onclick="findId()" style="font-size: 7pt"> <input
				id="closeBtn" type="button"
				style="background-color: white; border: 1px solid black; border-radius: 5px; cursor: pointer;"
				value="닫기" style="font-size: 7pt" onclick="window.close();">
			<%
			}
			%>

		</div>
	</div>
</body>
</html>