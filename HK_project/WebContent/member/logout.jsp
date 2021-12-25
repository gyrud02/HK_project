<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 로그 아웃을 클릭했을 때 발생하는 페이지 --%>

<%
	// session내장객체 메모리에 접근하여 session 내장객체 메모리에 저장되어 있는 값들을 모두 제거한다.
	session.invalidate();
%>
	<script type="text/javascript">
		alert("로그아웃 되었습니다."); // 로그아웃되었다는 알림창
		location.href = "../index.jsp";	 // 메인화면으로 이동한다.
	</script>