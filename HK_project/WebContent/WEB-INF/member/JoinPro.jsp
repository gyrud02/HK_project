<%@page import="JoinMember.MemberDAO"%>
<%@page import="JoinMember.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%-- 회원 가입 완료 시 처리되는 페이지 --%>
<%
	// 1. 한글 처리
	request.setCharacterEncoding("UTF-8"); 
	
	// 2. 회원 정보 가져오기
	String name = request.getParameter("name"); // 이름
	String id = request.getParameter("id"); // 아이디
	String pwd = request.getParameter("pwd"); // 비밀번호
	String gender = request.getParameter("gender"); // 성별
	String age = request.getParameter("age"); // 나이
	String phone = request.getParameter("phone"); // 전화번호
	String email = request.getParameter("email"); // 이메일
	String postcode = request.getParameter("sample6_postcode"); // 우편번호
	String address = request.getParameter("sample6_address"); // 주소
	String etc = request.getParameter("etc"); // 기타사항

	// 3. 입력한 회원정보들을 MemberBean 객체를 생성하여 각각 변수에 저장한다.
	// MemberBean memberBean = new MemberBean();
%>
	<jsp:useBean id="memberBean" class="JoinMember.MemberBean"/>
<%	
	// 4. setter메서드를 호출하여 매개변수로 전달하여 MemberBean의 각 변수에 저장한다.
	memberBean.setName(name);
	memberBean.setId(id);
	memberBean.setPwd(pwd);
	memberBean.setGender(gender);
	memberBean.setAge(age);
	memberBean.setPhone(phone);
	memberBean.setEmail(email);
	memberBean.setPostcode(postcode);
	memberBean.setAddress(address);
	memberBean.setEtc(etc);
	
	// 5. DB와 연동하여 입력한 회원정보를 DB의 JoinMember테이블에 추가시키는 역할의 
	// MemberDAO 객체를 생성하고  메서드를 호출하여 등록 작업을 한다.
%>
	<jsp:useBean id="memberDAO" class="JoinMember.MemberDAO" scope="page"/>
<%
	memberDAO.insertMember(memberBean);

	if(memberBean != null){ 
		// 6. 회원가입에 성공하면 login.jsp를 재요청하여 보여준다.
		out.write("<script>");
		out.write("alert('회원가입 되었습니다.'); location.href='login.jsp';");
		out.write("</script>");
	}
%>