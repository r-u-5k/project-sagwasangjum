<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.member.Member"%>
<%@page import="com.itwill.shop.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*
		0  . GET방식요청일때 user_main.jsp로 redirection
		1  . 요청객체 인코딩설정
	    2  . 파라메타 받기
	    3  . UserService객체생성
	    4  . UserService.create() 메쏘드실행
	    5-1. 아이디중복이면 user_write_form.jsp  
	    5-2. 가입성공이면   user_login_form.jsp 로 redierction
	*/
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}
//회원가입 폼에서 파라미터 값 얻기, 멤버객체 생성
	String getMId = request.getParameter("mId");
	String getMPw = request.getParameter("mPw");
	String getMName = request.getParameter("mName");
	String getMPhone1 = request.getParameter("mPhone1");
	String getMPhone2 = request.getParameter("mPhone2");
	String getMPhone3 = request.getParameter("mPhone3");
	String getMEmail1 = request.getParameter("mEmail1");
	String getMEmail2 = request.getParameter("mEmail2");
	String getMAddress = request.getParameter("mAddress");
	Member member= Member.builder()
						 .mId(getMId)
						 .mPw(getMPw)
						 .mName(getMName)
						 .mPhone(getMPhone1+'-'+getMPhone2+'-'+getMPhone3)
						 .mEmail(getMEmail1+'@'+getMEmail2)
						 .mAddress(getMAddress)
						 .build(); 
	
	MemberService memberService=new MemberService();
	int result=memberService.create(member);
	if(result ==-1){
		/*##############아이디중복##############*/
		String msg=getMId+"는 이미 존재하는 아이디입니다.";
		
		/*****************case1 script***********************/
		out.println("<script>");
		out.println(" alert('"+msg+"');");
		out.println(" location.href='member_write_form.jsp';");
		out.println("</script>");
		/***************************************************/
		
		/*****************case2 redirect*********************
		response.sendRedirect("member_write_form.jsp");
		****************************************************/
		
		/*****************case3 forward*********************
		***************************************************/
		return;
	}else if(result ==1){
		//가입성공
		response.sendRedirect("member_login_form.jsp");
		return;
	}
%>











