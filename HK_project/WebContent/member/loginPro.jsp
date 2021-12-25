<%@page import="JoinMember.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%-- 로그인 하였을 때 나타내는 페이지   --%>
 <%
 	// 1. 한글 처리
 	request.setCharacterEncoding("UTF-8"); 
 	
 	// 2. login.jsp에 입력한 name이 id와 pwd인 값을 가져오기
 	String id = request.getParameter("id"); // 아이디
 	String pwd = request.getParameter("pwd"); // 비밀번호
 	
 	// 3. DB작업을 위해 MemberDAO의 로그인 처리시 사용하는 메소드 userCheck() 생성하기
%>
	<jsp:useBean id="memberDAO" class="JoinMember.MemberDAO"/>
<% 	
	// 4. MemberDAO의 userCheck() 호출 시 입력한 id와 pwd를 전달하여 DB에 데이터가 존재하는지 확인한다.
 	int check = memberDAO.userCheck(id, pwd);
 
	// 5. 입력한 id, pwd가 DB에 존재한다면 
	if(check == 1){ // id, pwd 둘 다 존재

		// 로그인이 되었다라는 값을 session객체 저장 후 포워딩한다.
		session.setAttribute("id", id); // session객체는 웹브라우저 창을 닫으면 데이터가 사라진다.

		out.write("<script>");
		out.write("alert('로그인되었습니다.'); location.href='../index.jsp';");
		out.write("</script>");

//		response.sendRedirect("../index.jsp"); // sendRedirect()는 자바스크립트가 실행하지 않아서 out.write를 사용한다.

	}else if(check == 0){ // id만 존재
%>		
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다."); 
			history.back(); // 이전 페이지 login.jsp로 이동한다.
		</script>	
<% 	
	}else if(check == -1){ // id도 존재하지 않음
%>		
		<script type="text/javascript">
			alert("아이디가 존재하지 않습니다.");		
			history.go(-1); // 이전 페이지 login.jsp로 이동한다.
		</script>
<%
	} // if문 끝 
%>