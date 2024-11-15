<%@page import="com.itwill.shop.member.MemberService"%>
<%@page import="com.itwill.shop.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
if(request.getMethod().equals("GET")){
	response.sendRedirect("member_login_form.jsp");
	return;
}

try{
	request.setCharacterEncoding("UTF-8");
//수정폼 파라미터 값 받아오기	
String getMId = request.getParameter("mId");
String getMPw = request.getParameter("mPw");
String getMName = request.getParameter("mName");
String getMPhone1 = request.getParameter("mPhone1");
String getMPhone2 = request.getParameter("mPhone2");
String getMPhone3 = request.getParameter("mPhone3");
String getMEmail1 = request.getParameter("mEmail1");
String getMEmail2 = request.getParameter("mEmail2");
String getMAddress = request.getParameter("mAddress");
//멤버객체에 대입
Member member= Member.builder()
					 .mId(sMemberId)
					 .mPw(getMPw)
					 .mName(getMName)
					 .mPhone(getMPhone1+"-"+getMPhone2+"-"+getMPhone3)
					 .mEmail(getMEmail1+"@"+getMEmail2)
					 .mAddress(getMAddress)
					 .build(); 
MemberService memberService = new MemberService();
//멤버정보 업데이트
int result=memberService.update(member);
response.sendRedirect("member_view.jsp");
}catch(Exception e){
	e.printStackTrace();
		response.sendRedirect("member_error.jsp");
}
%>

    
 



