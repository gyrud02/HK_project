<%@page import="FileBoard.FileDAO"%>
<%@page import="FileBoard.FileBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 새 창에서 삭제 버튼을 누르면 실행되는 페이지 --%>
<%
	request.setCharacterEncoding("UTF-8"); // 한글 처리
	
	String name = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	
	FileBean fileBean = new FileBean();
	FileDAO fileDAO = new FileDAO();
	
	fileBean.setNum(num);
	fileBean.setName(name);
	
	int check = fileDAO.deleteBoard(num, name); 
	
	if(check == 1){
		
		response.sendRedirect("../Menu/fileboard.jsp");
	
	}else if(check == 0){
%>		
	<script type="text/javascript">
		alert("글 삭제에 실패하였습니다.\n담당자에게 문의하세요.");
	</script>
<%		
	} // if문 끝
%>