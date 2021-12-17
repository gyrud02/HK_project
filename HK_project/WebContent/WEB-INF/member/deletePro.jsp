<%@page import="JoinMember.MemberDAO"%>
<%@page import="JoinMember.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 회원 탈퇴 버튼을 누르면 실행되는 페이지 --%>
<%
	request.setCharacterEncoding("UTF-8"); // 한글 처리

//	String id = request.getParameter("id");
	String id = (String)session.getAttribute("id");
	
	MemberBean memberBean = new MemberBean();
	MemberDAO memberDAO = new MemberDAO(); // 메소드 실행을 위해 객체 생성
	
	memberBean.setId(id);
	
	int result = memberDAO.deleteUser(id);
	
	if(result == 1){ // 삭제하려는 아이디를 조회했을 때 해당하는 아이디가 있다면

		session.invalidate(); // 세션의 모든 속성을 삭제한다.
		response.sendRedirect("../index.jsp");
	
	}else if(result == 0){
%>
 	<script type="text/javascript">
		alert("회원 탈퇴 처리에 실패하였습니다.\n담당자에게 문의하세요.");
		history.back();
	</script>
<%
	} // if문 끝
		
%>