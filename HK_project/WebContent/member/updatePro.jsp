<%@page import="JoinMember.MemberDAO"%>
<%@page import="JoinMember.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 회원정보 수정하는 페이지 --%>
<%
	// 1. 한글 처리
	request.setCharacterEncoding("UTF-8");

	// 2. 변수에 값 저장하기
	String id = request.getParameter("id"); // 아이디
	String phone = request.getParameter("phone"); // 전화번호
	String email = request.getParameter("email"); // 이메일
	String etc = request.getParameter("etc"); // 기타
	
	// 3. 객체 생성
	MemberDAO memberDAO = new MemberDAO();
	MemberBean memberBean = new MemberBean();
	memberBean.setPhone(phone);
	memberBean.setEmail(email);
	memberBean.setEtc(etc);
	memberBean.setId(id);
	
	boolean tf = memberDAO.updateUser(memberBean);
	
	if(tf == true){
		
		out.write("<script>");
		out.write("alert('회원 정보 수정이 완료되었습니다.'); location.href='update.jsp';");
		out.write("</script>");
		
	}else if(tf == false){
%>		
		<script type="text/javascript">
			alert("회원 정보 수정에 실패하였습니다.");
			location.href="update.jsp";
		</script>
<%	
	} // if문 끝
%>